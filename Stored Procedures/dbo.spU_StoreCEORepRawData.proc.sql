USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spU_StoreCEORepRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spU_StoreCEORepRawData
GO

CREATE PROCEDURE dbo.spU_StoreCEORepRawData
	@RefDate datetime
AS

------------------------------------------------------------------------

SET NOCOUNT ON;

CREATE TABLE #FullSet(
	Id Integer
	,FundName 			nvarchar(150)
	,ShortCode 			Nvarchar(20)
	,Company 			NvarChar(15)
	,BaseCCYIso 		NvarChar(3)
	,Inception 			Datetime
	,LastPMChange		Datetime
	,BenCode  			NvarChar(15)
	,BenName 			NvarChar(100)
	,PrimaryObj 		NvarChar(50)
	,InvManager 		NvarChar(100)
	,OurTeam 			NvarChar(100)
	,OurPM 				NVarChar(100)
--	,OurAnalyst 		NVarChar(100)
	,SoldAs 			NvarChar(100)
	,InAs 				NvarChar(100)
	,IUProduct 			NvarChar(50)
	,Classification 	NvarChar(100)
	,PeerGroup 			NvarChar(100)
	,PeerGroupLabel 	NvarChar(100)
	,RefDate 			Datetime
	,LastBusinessDay 	Datetime
	,AuM 				float
	,ProdTER 		float
	,NP1m 			float
	,NP3m 			float
	,NP6m 			float
	,NP1y 			float
	,NP2y 			float
	,NP3y 			float
	,NP5y 			float
	,NPYtD 			float
	,[NPy-1] 		float
	,[NPy-2] 		float
	,[NPy-3] 		float
	,[NPy-4] 		float
	,[NPy-5] 		float
	,NPEo2y_TD 		float	
	,NPEo3y_TD 		float	
	,NP_SI 			float
	,NP_SLMC		float
	,NP2y_a 		float
	,NP3y_a 		float
	,NP5y_a 		float
	,NPEo2y_TD_a 		float
	,NPEo3y_TD_a 		float
	,NP_SI_a 		float
	,NP_SLMC_a		float
	,GP1m 			float
	,GP3m 			float
	,GP6m 			float
	,GP1y 			float
	,GP2y 			float
	,GP3y 			float
	,GP5y 			float
	,GPYtD			float
	,[GPy-1] 		float
	,[GPy-2] 		float
	,[GPy-3] 		float
	,[GPy-4] 		float
	,[GPy-5] 		float
	,GPEo2y_TD 		float
	,GPEo3y_TD 		float
	,GP_SI 			float
	,GP_SLMC		float
	,GP2y_a 		float
	,GP3y_a 		float
	,GP5y_a 		float
	,GPEo2y_TD_a 		float
	,GPEo3y_TD_a 		float
	,GP_SI_a 			float
	,GP_SLMC_a			float
	,ProdRank1m 		float
	,ProdRank3m 		float
	,ProdRank6m 		float
	,ProdRank1y 		float
	,ProdRank2y 		float
	,ProdRank3y 		float
	,ProdRank5y 		float
	,ProdRankYtD 		float
	,[ProdRanky-1] 		float
	,[ProdRanky-2] 		float
	,[ProdRanky-3] 		float
	,[ProdRanky-4] 		float
	,[ProdRanky-5] 		float
	,ProdRankEo2y_TD 	float
	,ProdRankEo3y_TD 	float
	,ProdRank_SI 		float
	,ProdRank_SLMC 		float
	,Ben1m 				float
	,Ben3m 				float
	,Ben6m 				float
	,Ben1y 				float
	,Ben2y 				float
	,Ben3y 				float
	,Ben5y 				float
	,BenYtD 			float
	,[Beny-1] 			float
	,[Beny-2] 			float
	,[Beny-3] 			float
	,[Beny-4] 			float
	,[Beny-5] 			float
	,BenEo2y_TD 		float
	,BenEo3y_TD 		float
	,Ben2y_a 			float
	,Ben3y_a 			float
	,Ben5y_a 			float
	,BenEo2y_TD_a 		float
	,BenEo3y_TD_a 		float
	,Ben_SI				float
	,Ben_SI_a 			float
	,Ben_SLMC			float
	,Ben_SLMC_a 		float
	,PeersNo1m 			float
	,PeersNo3m 			float
	,PeersNo6m 			float
	,PeersNo1y 			float
	,PeersNo2y 			float
	,PeersNo3y 			float
	,PeersNo5y 			float
	,PeersNoYtD 		float
	,[PeersNoy-1] 		float
	,[PeersNoy-2] 		float
	,[PeersNoy-3] 		float
	,[PeersNoy-4] 		float
	,[PeersNoy-5] 		float
	,PeersNoEo2y_TD 	float
	,PeersNoEo3y_TD 	float
	,PeersNo_SI 		float
	,PeersNo_SLMC 		float
	,PG1stQ_r1m 		float
	,PG1stQ_r3m 		float
	,PG1stQ_r6m 		float
	,PG1stQ_r1y 		float
	,PG1stQ_r2y 		float
	,PG1stQ_r3y 		float
	,PG1stQ_r5y 		float
	,PG1stQ_rYtD 		float
	,[PG1stQ_ry-1] 		float
	,[PG1stQ_ry-2] 		float
	,[PG1stQ_ry-3]  	float
	,[PG1stQ_ry-4] 		float
	,[PG1stQ_ry-5] 		float
	,PG1stQ_rEo2y_TD 	float
	,PG1stQ_rEo3y_TD 	float
	,PG1stQ_r2y_a	 	float
	,PG1stQ_r3y_a 		float
	,PG1stQ_r5y_a 		float
	,PG1stQ_rEo2y_TD_a 	float
	,PG1stQ_rEo3y_TD_a 	float
	,PG1stQ_r_SI 		float
	,PG1stQ_r_SI_a 		float
	,PG1stQ_r_SLMC		float
	,PG1stQ_r_SLMC_a	float
	,PG3stQ_r1m 		float
	,PG3stQ_r3m 		float
	,PG3stQ_r6m 		float
	,PG3stQ_r1y 		float
	,PG3stQ_r2y 		float
	,PG3stQ_r3y 		float
	,PG3stQ_r5y 		float
	,PG3stQ_rYtD 		float
	,[PG3stQ_ry-1] 		float
	,[PG3stQ_ry-2] 		float
	,[PG3stQ_ry-3] 		float
	,[PG3stQ_ry-4] 		float
	,[PG3stQ_ry-5] 		float
	,PG3stQ_rEo2y_TD 	float
	,PG3stQ_rEo3y_TD 	float
	,PG3stQ_r2y_a 		float
	,PG3stQ_r3y_a 		float
	,PG3stQ_r5y_a 		float
	,PG3stQ_rEo2y_TD_a 	float
	,PG3stQ_rEo3y_TD_a 	float
	,PG3stQ_r_SI 		float
	,PG3stQ_r_SI_a 		float
	,PG3stQ_r_SLMC 		float
	,PG3stQ_r_SLMC_a 	float
	,PGavg_r1m 			float
	,PGavg_r3m 			float
	,PGavg_r6m 			float
	,PGavg_r1y 			float
	,PGavg_r2y 			float
	,PGavg_r3y 			float
	,PGavg_r5y 			float
	,PGavg_rYtD 		float
	,[PGavg_ry-1] 		float
	,[PGavg_ry-2] 		float
	,[PGavg_ry-3] 		float
	,[PGavg_ry-4] 		float
	,[PGavg_ry-5] 		float
	,PGavg_rEo2y_TD 	float
	,PGavg_rEo3y_TD 	float
	,PGavg_r2y_a 		float
	,PGavg_r3y_a 		float
	,PGavg_r5y_a 		float
	,PGavg_rEo2y_TD_a 	float
	,PGavg_rEo3y_TD_a 	float
	,PGavg_r_SI 		float
	,PGavg_r_SI_a 		float
	,PGavg_r_SLMC 		float
	,PGavg_r_SLMC_a 	float
	,PGmed_r1m 			float
	,PGmed_r3m 			float
	,PGmed_r6m 			float
	,PGmed_r1y 			float
	,PGmed_r2y 			float
	,PGmed_r3y 			float
	,PGmed_r5y 			float
	,PGmed_rYtD 		float
	,[PGmed_ry-1] 		float
	,[PGmed_ry-2] 		float
	,[PGmed_ry-3] 		float
	,[PGmed_ry-4] 		float
	,[PGmed_ry-5] 		float
	,PGmed_rEo2y_TD 	float
	,PGmed_rEo3y_TD 	float
	,PGmed_r2y_a 		float
	,PGmed_r3y_a 		float
	,PGmed_r5y_a 		float
	,PGmed_rEo2y_TD_a	float
	,PGmed_rEo3y_TD_a	float
	,PGmed_r_SI			float
	,PGmed_r_SI_a		float
	,PGmed_r_SLMC		float
	,PGmed_r_SLMC_a		float
	, ProdIR1m			float
	, ProdIR3m			float
	, ProdIR6m			float
	, ProdIRYtD			float
	, ProdIR1y			float
	, ProdIR2y			float
	, ProdIR3y			float
	, ProdIR5y			float
	, [ProdIRy-1]		float
	, [ProdIRy-2]		float
	, [ProdIRy-3]		float
	, [ProdIRy-4]		float
	, [ProdIRy-5]		float
	, ProdIREo2y_TD		float
	, ProdIREo3y_TD		float
	, ProdIR_SI			float
)

-------------------------------------------------------------------

INSERT INTO #FullSet
EXEC dbo.spS_GetPerfRawData @RefDate, 1, null, null

-------------------------------------------------------------------

SELECT	FS.Id AS FundId
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			FS.PeerGroupLabel
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			FS.Classification
		END) AS PeerGroup
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank1m AS float)/FS.PeersNo1m
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank1m AS float)/VW.PGIRNum1m
		END) AS Perc1m
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank3m AS float)/FS.PeersNo3m
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank3m AS float)/VW.PGIRNum3m
		END)  AS Perc3m
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRankYtD AS float)/FS.PeersNoYtD
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRankYtD AS float)/VW.PGIRNumYtD
		END)  AS PercYtD
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank1y AS float)/FS.PeersNo1y
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank1y AS float)/VW.PGIRNum1y
		END) AS Perc1y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank2y AS float)/FS.PeersNo2y
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank2y AS float)/VW.PGIRNum2y
		END) AS Perc2y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank3y AS float)/FS.PeersNo3y
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank3y AS float)/VW.PGIRNum3y
		END) AS Perc3y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRank5y AS float)/FS.PeersNo5y
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRank5y AS float)/VW.PGIRNum5y
		END) AS Perc5y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRankEo2y_TD AS float)/FS.PeersNoEo2y_TD
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRankEo2y_TD AS float)/VW.PGIRNumEo2y_TD
		END) AS PercEo2y_TD
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
			CAST(FS.ProdRankEo3y_TD AS float)/FS.PeersNoEo3y_TD
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
			CAST(VW.ProdIRRankEo3y_TD AS float)/VW.PGIRNumEo3y_TD
		END) AS PercEo3y_TD

INTO	#Percentiles
	
FROM 	#FullSet AS FS LEFT JOIN
		vw_AllPerfDataset AS VW ON (
		FS.Id = VW.Id
		AND FS.RefDate = vw.RefDate
		)

WHERE	(FS.PeerGroup IS NOT NULL) OR (FS.PrimaryObj = 'IsraelsenVsPeers')

-------------------------------------------------------------------


SELECT	FundId
	, dbo.fn_GetQuartile(Perc1m, 1) AS Quart1m
	, dbo.fn_GetQuartile(Perc3m, 1) AS Quart3m
	, dbo.fn_GetQuartile(PercYtD, 1) AS QuartYtD
	, dbo.fn_GetQuartile(Perc1y, 1) AS Quart1y
	, dbo.fn_GetQuartile(Perc2y, 1) AS Quart2y
	, dbo.fn_GetQuartile(Perc3y, 1) AS Quart3y
	, dbo.fn_GetQuartile(Perc5y, 1) AS Quart5y
	, dbo.fn_GetQuartile(PercEo2y_TD, 1) AS QuartEo2y_TD
	, dbo.fn_GetQuartile(PercEo3y_TD, 1) AS QuartEo3y_TD

INTO	#Quartiles
	
FROM 	#Percentiles

--------------------------------------------------
--------------------------------------------------

SELECT	FS.Id AS FundId
	, FS.NP1m - FS.Ben1m AS BenchRP1m
	, FS.NP3m - FS.Ben3m AS BenchRP3m
	, FS.NPYtD - FS.BenYtD AS BenchRPYtD
	, FS.NP1y - FS.Ben1y AS BenchRP1y
	, FS.NP2y_a - FS.Ben2y_a AS BenchRP2ya
	, FS.NP3y_a - FS.Ben3y_a AS BenchRP3ya
	, FS.NP5y_a - FS.Ben5y_a AS BenchRP5ya
	, FS.NPEo2y_TD_a - FS.BenEo2y_TD_a AS BenchRPEo2y_TDa
	, FS.NPEo3y_TD_a - FS.BenEo3y_TD_a AS BenchRPEo3y_TDa

INTO	#BenRP
	
FROM 	#FullSet AS FS

WHERE	FS.BenCode IS NOT NULL

--------------------------------------------------

DECLARE @LastMonthDate datetime
DECLARE @AuMDateToUse datetime

SET @LastMonthDate =	(SELECT MAX(RefDate)
						FROM	tbl_FinanceAuM
						WHERE	RefDate <= @RefDate)
SET @AuMDateToUse = (SELECT
						(CASE WHEN @LastMonthDate = @RefDate 
						THEN @RefDate 
						ELSE @LastMonthDate END)
					)

--SELECT @LastMonthDate AS LastMonth, @RefDate AS RefDate, @AuMDateToUse AS UsedDate

--------------------------------------------------

SELECT Funds.Id
	, Funds.FundName
	, Funds.Company
	, Funds.SoldAs
	, Funds.PrimaryObj
	, (CASE WHEN Peers.CatSelector IS NULL THEN 0
		ELSE 1 END) AS IsPeerGroupDefined
	, Peers.CatSelector AS PeerGroup
	, (CASE WHEN Funds.BenchmarkId IS NULL THEN 0
		ELSE 1 END) AS IsBenchmarkDefined
	, Bench.Code AS BenchCode
	, Bench.LongName As BenchName
	, Funds.OurTeam
	, AuM.AuMGBP

INTO	#FundsDets

FROM	tbl_Products AS Funds LEFT JOIN
	tbl_PeerGroupsDefs AS Peers ON (
		Peers.FundId = Funds.Id
		) LEFT JOIN
	tbl_FinanceAuM AS AuM ON (
		Funds.ShortCode = AuM.ShortCode
--		Funds.FinanceName = AuM.FinanceName
--		AND Funds.Company = AuM.Company
		) LEFT JOIN
	tbl_Benchmarks AS Bench ON (
		Funds.BenchmarkId = Bench.Id
		)

WHERE	SoldAs NOT IN ('HF', 'Mandate')
	AND AuM.RefDate = @AuMDateToUse
	AND Funds.InceptionDate < @RefDate
	AND (Funds.CloseDate > @RefDate OR Funds.CloseDate IS NULL)

--------------------------------------------------

DECLARE @TotAuM float
SET @TotAuM = (SELECT SUM(AuMGBP) FROM #FundsDets)

--------------------------------------------------

DELETE
FROM	tbl_EoMPerfSummary
WHERE	RefDate = @RefDate

--------------------------------------------------

INSERT INTO tbl_EoMPerfSummary

SELECT	Dets.Id AS FundId
	, @RefDate AS RefDate
	, Dets.FundName
	, Dets.Company
	, Dets.SoldAs
	, Dets.PrimaryObj
	, Dets.IsPeerGroupDefined
	, P.PeerGroup
	, Dets.IsBenchmarkDefined
	, Dets.BenchCode
	, Dets.BenchName
	, Dets.OurTeam
	, Dets.AuMGBP
	, Dets.AuMGBP/@TotAuM AS AuMWeight
	, Q.Quart1m
	, Q.Quart3m
	, Q.QuartYtD
	, Q.Quart1y
	, Q.Quart2y
	, Q.Quart3y
	, Q.Quart5y
	, Q.QuartEo2y_TD
	, Q.QuartEo3y_TD
	, P.Perc1m
	, P.Perc3m
	, P.PercYtD
	, P.Perc1y
	, P.Perc2y
	, P.Perc3y
	, P.Perc5y
	, P.PercEo2y_TD
	, P.PercEo3y_TD
	, B.BenchRP1m
	, B.BenchRP3m
	, B.BenchRPYtD
	, B.BenchRP1y
	, B.BenchRP2ya
	, B.BenchRP3ya
	, B.BenchRP5ya
	, B.BenchRPEo2y_TDa
	, B.BenchRPEo3y_TDa

FROM	#FundsDets AS Dets LEFT JOIN 
	#Percentiles AS P ON (
		Dets.Id = P.FundId
	) LEFT JOIN #Quartiles AS Q ON (
		Dets.Id = Q.FundId
	) LEFT JOIN #BenRP AS B ON (
		Dets.Id = B.FundId
	)

--------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #Quartiles
DROP TABLE #Percentiles
DROP TABLE #FundsDets
DROP TABLE #BenRP

----------------------------------------------------------------------------------

GO
GRANT EXECUTE ON dbo.spU_StoreCEORepRawData TO [OMAM\Compliance]