USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetDashboardRiskRep') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetDashboardRiskRep
GO

CREATE PROCEDURE dbo.spS_GetDashboardRiskRep
	@RefDate datetime
	, @Lookback integer
AS

SET NOCOUNT ON;

DECLARE @FirstDate datetime
SET @FirstDate = Dateadd(mm, - @LookBack, @RefDate)

/* 
	TO-DO LIST
*/

----------------------------------------------------------------------
--== Clean up SIG/Factset data --==
SELECT *
INTO #FactsetSet
FROM [OMAMPROD01].[Product].dbo.vew_FSR_FacstetDailyRisk
WHERE	NavDate <= @RefDate
		AND NavDate >= @FirstDate
-- cleanup clauses
		AND [Portfolio VAR] < 50
		AND FundCode not in ('SKEUREQ', 'SKGBLBND', 'SKUSCAPGR', 'SKJPNEQ')

----------------------------------------------------------------------
--== THE DATES BIT SIG ==--
SELECT	V.FundCode
		, MAX(NAVDate) AS LastDate
INTO	#LDatesSIG
FROM	#FactsetSet AS V 
--FROM	[OMAMPROD01].[Product].dbo.vew_FSR_FacstetDailyRisk AS V 
WHERE		V.NaVDate <= @RefDate
GROUP BY	V.FundCode

SELECT	V.FundCode
		, MAX(NAVDate) AS PrevDate
INTO	#PDatesSIG
FROM	#FactsetSet AS V FULL JOIN
--FROM	[OMAMPROD01].[Product].dbo.vew_FSR_FacstetDailyRisk AS V FULL JOIN
		#LDatesSIG AS L ON (
			V.FundCode = L.FundCode
		)
WHERE		V.NaVDate < L.LastDate
GROUP BY	V.FundCode

--== THE DATES BIT OMAM ==--
SELECT	V.FundId
		, MAX(V.VaRDate) AS LastDate
INTO	#LDatesOMAM
FROM	[VIVALDI].dbo.vw_TotalVaRByFundByDate AS V 
WHERE		V.VaRDate <= @RefDate
GROUP BY	V.FundId

SELECT	V.FundId
		, MAX(V.VaRDate) AS PrevDate
INTO	#PDatesOMAM
FROM	[VIVALDI].dbo.vw_TotalVaRByFundByDate AS V FULL JOIN
		#LDatesOMAM AS L ON (
			V.FundId = L.FundId
		)
WHERE		V.VaRDate < L.LastDate
GROUP BY	V.FundId	

----------------------------------------------------------------------

--== LAST VALUES SIG ==--

SELECT	V.FundCode
		, V.[PortFolio VaR]/100 AS PortVaR
		, V.[Benchmark VaR]/100 AS BenchVaR
		, V.[Gross Weight]/100 AS GrossExp
		, V.[Net Weight]/100 AS NetExp
		, L.LastDate
INTO	#LastVaRSIG
FROM	#FactsetSet AS V FULL JOIN
--FROM	[PRODUCT].dbo.vew_FSR_FacstetDailyRisk AS V FULL JOIN
		#LDatesSIG AS L ON (
			V.NaVDate = L.LastDate
			AND V.FundCode = L.FundCode
		)
WHERE L.LastDate IS NOT NULL

--== PREV VALUES SIG ==--
SELECT	V.FundCode
		, V.[PortFolio VaR]/100 AS PortVaR
		, V.[Benchmark VaR]/100 AS BenchVaR
		, V.[Gross Weight]/100 AS GrossExp
		, V.[Net Weight]/100 AS NetExp
		, L.PrevDate
INTO	#PrevVaRSIG
FROM	#FactsetSet AS V FULL JOIN
--FROM	[PRODUCT].dbo.vew_FSR_FacstetDailyRisk AS V FULL JOIN
		#PDatesSIG AS L ON (
			V.NaVDate = L.PrevDate
			AND V.FundCode = L.FundCode
		)
WHERE L.PrevDate IS NOT NULL

--== LAST VALUES OMAM ==--
SELECT	V.FundId
		, V.PercentVaR AS PortVaR
		, B.VaRbench/E.CostNaV AS BenchVaR
		, E.GrossExposure AS GrossExp
		, E.NetExposure AS NetExp
		, L.LastDate
INTO	#LastVaROMAM
FROM	[VIVALDI].dbo.vw_TotalVaRByFundByDate AS V FULL JOIN
		#LDatesOMAM AS L ON (
			V.VaRDate = L.LastDate
			AND V.FundId = L.FundId
			) LEFT JOIN
		[VIVALDI].dbo.vw_RelativeVaRReports AS B ON (
			V.VaRDate = B.ReportDate
			AND V.FundId = B.FundId 
			) LEFT JOIN
		[VIVALDI].dbo.tbl_FundsNaVsAndPLs AS E ON (
			V.VaRDate = E.NaVPLDate
			AND V.FundID = E.FundId
			)
WHERE L.LastDate IS NOT NULL

--== PREV VALUES OMAM ==--
SELECT	V.FundId
		, V.PercentVaR AS PortVaR
		, B.VaRbench/E.CostNaV AS BenchVaR
		, E.GrossExposure AS GrossExp
		, E.NetExposure AS NetExp
		, L.PrevDate
INTO	#PrevVaROMAM
FROM	[VIVALDI].dbo.vw_TotalVaRByFundByDate AS V FULL JOIN
		#PDatesOMAM AS L ON (
			V.VaRDate = L.PrevDate
			AND V.FundId = L.FundId
			) LEFT JOIN
		[VIVALDI].dbo.vw_RelativeVaRReports AS B ON (
			V.VaRDate = B.ReportDate
			AND V.FundId = B.FundId
			) LEFT JOIN
		[VIVALDI].dbo.tbl_FundsNaVsAndPLs AS E ON (
			V.VaRDate = E.NaVPLDate
			AND V.FundID = E.FundId
			)
WHERE L.PrevDate IS NOT NULL

----------------------------------------------------------------------
--== PERIOD VALUES SIG ==--
SELECT	V.FundCode
		, 'MCVaR 99%, 1d, 1y Lbck' AS VaRModel
		, COUNT(V.[Portfolio VaR]) AS VaRObs
		, MIN(V.[Portfolio VaR])/100 AS PortVaRMin
		, MAX(V.[Portfolio VaR])/100 AS PortVaRMax
		, AVG(V.[Portfolio VaR])/100 AS PortVaRAvg
		, StDev(V.[Portfolio VaR])/100 AS PortVaRStD
		, MIN(V.[Benchmark VaR])/100 AS BenVaRMin
		, MAX(V.[Benchmark VaR])/100 AS BenVaRMax
		, AVG(V.[Benchmark VaR])/100 AS BenVaRAvg
		, StDev(V.[Benchmark VaR])/100 AS BenVaRStD
		, MIN(V.[Gross Weight])/100 AS GrossExpMin
		, MAX(V.[Gross Weight])/100 AS GrossExpMax
		, AVG(V.[Gross Weight])/100 AS GrossExpAvg
		, StDev(V.[Gross Weight])/100 AS GrossExpStD
		, MIN(V.[Net Weight])/100 AS NetExpMin
		, MAX(V.[Net Weight])/100 AS NetExpMax
		, AVG(V.[Net Weight])/100 AS NetExpAvg
		, StDev(V.[Net Weight])/100 AS NetExpStD
		, COUNT(V.[Portfolio VaR]) * (1-0.99) AS ExpectedVaREvents
		, SUM(CASE WHEN -V.[Portfolio VaR] > 
					V.[Portfolio Gross Return] THEN 1 
					ELSE 0 END) AS VaREventsNeg
		/*, SUM(CASE WHEN V.[Portfolio VaR] < 
					V.[Portfolio Gross Return] THEN 1 
					ELSE 0 END) AS VaREventsPos*/
INTO	#PerSIG
FROM	#FactsetSet AS V
--FROM	[Product].dbo.vew_FSR_FacstetDailyRisk AS V
WHERE		V.NaVDate <= @RefDate
			AND V.NaVDate > @FirstDate
GROUP BY	V.FundCode

UPDATE #PerSig
SET		FundCode = 'SKUKOPP'
WHERE	FundCode = 'UKOPP'

UPDATE #LastVaRSIG
SET		FundCode = 'SKUKOPP'
WHERE	FundCode = 'UKOPP'

UPDATE #PrevVaRSIG
SET		FundCode = 'SKUKOPP'
WHERE	FundCode = 'UKOPP'

----------------------------------------------------------------------
--== PERIOD VALUES OMAM ==--
SELECT	V.FundId
		, V.VaRModel + ' ' + 
				CAST(CAST(V.VaRConfidence*100 AS INTEGER) AS NVARCHAR(3)) + 
				'%, ' +	V.VaRHorizon + ', 1y Lbck' AS VaRModel
		, COUNT(V.VaRDate) AS VaRObs
		, MIN(V.PercentVaR) AS PortVaRMin
		, MAX(V.PercentVaR) AS PortVaRMax
		, AVG(V.PercentVaR) AS PortVaRAvg
		, StDev(V.PercentVaR) AS PortVaRStD
		, MIN(B.VaRbench/PL.CostNaV) AS BenVaRMin
		, MAX(B.VaRbench/PL.CostNaV) AS BenVaRMax
		, AVG(B.VaRbench/PL.CostNaV) AS BenVaRAvg
		, StDev(B.VaRbench/PL.CostNaV) AS BenVaRStD
		, MIN(PL.GrossExposure) AS GrossExpMin
		, MAX(PL.GrossExposure) AS GrossExpMax
		, AVG(PL.GrossExposure) AS GrossExpAvg
		, StDev(PL.GrossExposure) AS GrossExpStD
		, MIN(PL.NetExposure) AS NetExpMin
		, MAX(PL.NetExposure) AS NetExpMax
		, AVG(PL.NetExposure) AS NetExpAvg
		, StDev(PL.NetExposure) AS NetExpStD
		, COUNT(V.VaRDate) * (1-V.VarConfidence) AS ExpectedVaREvents
		, SUM(CASE WHEN -V.PercentVaR > 
					PL.TotalPl/PL.CostNaV THEN 1 
					ELSE 0 END) AS VaREventsNeg
		/*, SUM(CASE WHEN V.PercentVaR < 
					PL.TotalPl/PL.CostNaV THEN 1 
					ELSE 0 END) AS VaREventsPos*/
INTO	#PerOMAM
FROM	[Vivaldi].dbo.vw_TotalVaRByFundByDate AS V LEFT JOIN
		[Vivaldi].dbo.vw_RelativeVaRReports AS B ON (
			V.VaRDate = B.ReportDate
			AND V.FundId = B.FundId
			) LEFT JOIN 
		[Vivaldi].dbo.tbl_FundsNaVsAndPLs AS PL ON (
			V.VaRDate = PL.NaVPLDate
			AND V.FundId = PL.FundId
			)
WHERE		V.VARDate <= @RefDate
			AND V.VaRDate > @FirstDate
GROUP BY	V.FundID
			, V.VaRModel
			, V.VaRConfidence
			, V.VaRHorizon
----------------------------------------------------------------------
--== BRINGING IT ALL TOGETHER ==--

SELECT	PerOMAM.VaRModel
		, PerOMAM.VaRObs
		, PerOMAM.PortVaRMin
		, PerOMAM.PortVaRMax
		, PerOMAM.PortVaRAvg
		, PerOMAM.PortVaRStD
		, PerOMAM.BenVaRMin
		, PerOMAM.BenVaRMax
		, PerOMAM.BenVaRAvg
		, PerOMAM.BenVaRStD
		, PerOMAM.ExpectedVaREvents
		, PerOMAM.VaREventsNeg
		, LOMAM.LastDate
		, POMAM.PrevDate
		, LOMAM.PortVaR AS LastVaR
		, POMAM.PortVaR AS PrevVaR
		, LOMAM.PortVaR-POMAM.PortVaR AS VaRDiff
		, (LOMAM.PortVaR - PerOMAM.PortVaRMin)/
			NULLIF(PerOMAM.PortVaRMax - PerOMAM.PortVaRMin,0) AS LastVaROnRange
		, LOMAM.BenchVaR AS LastBenVaR
		, POMAM.BenchVaR AS PrevBenVaR
		, LOMAM.BenchVaR-POMAM.BenchVaR AS BenVaRDiff
		, LOMAM.PortVaR/LOMAM.BenchVaR AS LastPortBenVaRRatio
		, PerOMAM.GrossExpMin
		, PerOMAM.GrossExpMax
		, PerOMAM.GrossExpAvg
		, PerOMAM.GrossExpStD
		, LOMAM.GrossExp AS LastGrossExp
		, POMAM.GrossExp AS PrevGrossExp
		, LOMAM.GrossExp-POMAM.GrossExp AS GrossExpDiff
		, (LOMAM.GrossExp - PerOMAM.GrossExpMin)/
			NULLIF(PerOMAM.GrossExpMax - PerOMAM.GrossExpMin,0) AS LastGExpOnRange
		, PerOMAM.NetExpMin
		, PerOMAM.NetExpMax
		, PerOMAM.NetExpAvg
		, PerOMAM.NetExpStD
		, LOMAM.NetExp AS LastNetExp
		, POMAM.NetExp AS PrevNetExp
		, LOMAM.NetExp-POMAM.NetExp AS NetExpDiff
		, (LOMAM.NetExp - PerOMAM.NetExpMin)/
			NULLIF(PerOMAM.NetExpMax - PerOMAM.NetExpMin,0) AS LastNExpOnRange
		, F.FundCode
INTO	#FullSet
FROM	#PerOMAM AS PerOMAM LEFT JOIN
		#LastVaROMAM AS LOMAM ON (
			PerOMAM.FundId = LOMAM.FundId
			) LEFT JOIN
		#PrevVaROMAM AS POMAM ON (
			PerOMAM.FundID = POMAM.FundId
			) LEFT JOIN
		[Vivaldi].dbo.tbl_Funds AS F ON (
			PerOMAM.FundId = F.Id
			)
UNION
SELECT	PerSIG.VaRModel
		, PerSIG.VaRObs
		, PerSIG.PortVaRMin
		, PerSIG.PortVaRMax
		, PerSIG.PortVaRAvg
		, PerSIG.PortVaRStD
		, PerSIG.BenVaRMin
		, PerSIG.BenVaRMax
		, PerSIG.BenVaRAvg
		, PerSIG.BenVaRStD
		, PerSIG.ExpectedVaREvents
		, PerSIG.VaREventsNeg
		, LSIG.LastDate
		, PSIG.PrevDate
		, LSIG.PortVaR AS LastVaR
		, PSIG.PortVaR AS PrevVaR
		, LSIG.PortVaR-PSIG.PortVaR AS VaRDiff
		, (LSIG.PortVaR - PerSIG.PortVaRMin)/
			NULLIF(PerSIG.PortVaRMax - PerSIG.PortVaRMin,0) AS LastVaROnRange
		, LSIG.BenchVaR AS LastBenVaR
		, PSIG.BenchVaR AS PrevBenVaR
		, LSIG.BenchVaR-PSIG.BenchVaR AS BenVaRDiff
		, LSIG.PortVaR/LSIG.BenchVaR AS LastPortBenVaRRatio
		, PerSIG.GrossExpMin
		, PerSIG.GrossExpMax
		, PerSIG.GrossExpAvg
		, PerSIG.GrossExpStD
		, LSIG.GrossExp AS LastGrossExp
		, PSIG.GrossExp AS PrevGrossExp
		, LSIG.GrossExp-PSIG.GrossExp AS GrossExpDiff
		, (LSIG.GrossExp - PerSIG.GrossExpMin)/
			NULLIF(PerSIG.GrossExpMax - PerSIG.GrossExpMin,0) AS LastGExpOnRange
		, PerSIG.NetExpMin
		, PerSIG.NetExpMax
		, PerSIG.NetExpAvg
		, PerSIG.NetExpStD
		, LSIG.NetExp AS LastNetExp
		, PSIG.NetExp AS PrevNetExp
		, LSIG.NetExp-PSIG.NetExp AS NetExpDiff
		, (LSIG.NetExp - PerSIG.NetExpMin)/
			NULLIF(PerSIG.NetExpMax - PerSIG.NetExpMin, 0) AS LastNExpOnRange
		, PerSig.FundCode
--		, PerSIG.FundName

--INTO	#FullSet
FROM	#PerSIG AS PerSIG LEFT JOIN
		#LastVaRSIG AS LSIG ON (
			PerSIG.FundCode = LSIG.FundCode
			) LEFT JOIN
		#PrevVaRSIG AS PSIG ON (
			PerSIG.FundCode = PSIG.FundCode
			)

----------------------------------------------------------------------
--== ADDING FUND DETAILS ==--
SELECT	Prod.ShortCode AS FundCode
		, Prod.FundName
		, Prod.Company
		, Prod.SoldAs
		, Prod.OurTeam AS Desk
		, Prod.OurPM AS PM
		, Bench.LongName AS BenchName
		, FS.*
		, Prod.IsSelect
		, Bench.Code AS BenchCode
		, Bench.IsCash AS IsBenchCash

FROM	tbl_Products AS Prod LEFT JOIN
		#FullSet As FS ON (
			Prod.ShortCode = FS.FundCode
		)	LEFT JOIN
		tbl_benchmarks AS Bench ON (
			Prod.BenchmarkId = Bench.Id
		)
WHERE	Prod.InceptionDate < @RefDate
		AND ISNULL(Prod.CloseDate,GetDate()) > @RefDate
		AND FS.VaRMODEL IS NOT NULL


ORDER BY	Prod.ShortCode
/*ORDER BY	IsSelect
			, Prod.OurTeam
			, Prod.OurPM
			, Prod.SoldAs
*/
----------------------------------------------------------------------
--== TESTS ==--
--SELECT * FROM #LDatesOMAM
--SELECT * FROM #PDatesOMAM
--SELECT * FROM #LastVaRSIG ORDER BY FundCode DESC
--SELECT * FROM #PrevVaRSIG ORDER BY FundCode DESC
--SELECT * FROM #LastVaROMAM
--SELECT * FROM #PrevVaROMAM
--SELECT * FROM #PerSIG ORDER BY FundCode DESC
--SELECT * FROM #PerOMAM ORDER BY FundId DESC
--SELECT * FROM #FullSet ORDER BY FundCode DESC


--== CLEAN UP == --
DROP TABLE #LDatesSIG
DROP TABLE #PDatesSIG
DROP TABLE #LDatesOMAM
DROP TABLE #PDatesOMAM
DROP TABLE #LastVaRSIG
DROP TABLE #PrevVaRSIG
DROP TABLE #LastVaROMAM
DROP TABLE #PrevVaROMAM
DROP TABLE #PerSIG
DROP TABLE #PerOMAM
DROP TABLE #FullSet
DROP TABLE #FactsetSet

-----------------------------------------------------------------

GO

GRANT EXECUTE ON dbo.spS_GetDashboardRiskRep TO [OMAM\Compliance]