USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_AllPerfDY]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_AllPerfDY]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_AllPerfDY]
AS 

SELECT 	Funds.Id AS FundId
	, Funds.Company
	, Funds.PrimaryObj
	, Funds.OurTeam
	, Desks.LongName As DeskName
	, Funds.OurPM
	, Funds.FundName + (CASE 
		WHEN Funds.RefShClass IS NULL THEN '' 
		ELSE ' - ' + Funds.RefShClass END ) AS FundName
	, Funds.InceptionDate
	, Funds.CloseDate
	, Bench.Id As BenchId
	, Bench.LongName AS BenchLongName
	, PeersDY.Classification +  ' - ' + PeersDY.Sector AS PeersDef
	, FundsDY.RefDate
	, FundsDY.FundNP/100 AS FundNP
	, FundsDY.FundRank
	, (CASE WHEN Bench.IsCash = 1 THEN NULL ELSE FundsDY.FundBeta END) AS FundBeta
	, (CASE WHEN Bench.IsCash = 1 THEN NULL ELSE FundsDY.FundAlpha/100 END) AS FundAlpha
	, (CASE WHEN Bench.IsCash = 1 THEN NULL ELSE FundsDY.FundTE/100 END) AS FundTE
	, FundsDY.FundSD/100 AS FundSD
	, PeersDY.PeersNo
	, PeersDY.Peers1stQ_r/100 AS Peers1stQ_r
	, PeersDY.Peers3stQ_r/100 AS Peers3stQ_r
	, PeersDY.PeersAvg/100 AS PeersAvg
	, PeersDY.PeersMed/100 AS PeersMed
	, BenchDY.BenchPerf/100 AS BenchPef
	, (CASE WHEN Bench.IsCash = 1 THEN NULL ELSE BenchDY.BenchSD/100 END) AS BenchSD
	, FundsDY.FundRank/PeersDY.PeersNo AS FundPercentile
	, dbo.fn_GetQuartile(CAST(FundsDY.FundRank AS Float)/PeersDY.PeersNo, 0) AS Quartile
	, (CASE WHEN BenchPerf IS NULL THEN NULL 
		WHEN FundNP > BenchPerf THEN 1 
			ELSE 0 END) AS IsAheadBen

FROM	tbl_products AS Funds LEFT JOIN 
	tbl_Benchmarks AS Bench ON (
		Funds.BenchmarkId = Bench.Id
		) LEFT JOIN
	tbl_FundsPerfsDY AS FundsDY ON (
		Funds.Id = FundsDY.FundId		
		) LEFT JOIN
	tbl_BenchPerfsDY AS BenchDY ON (
		BenchDY.BenchId = Bench.Id
		AND Funds.BaseCCYIso = BenchDY.CCY
		AND FundsDY.Year = BenchDY.Year
		) LEFT JOIN
	tbl_PeerGroupsDefs AS PGDefs ON (
		Funds.Id = PGDefs.FUndId
		) LEFT JOIN
	tbl_PeersPerfsDY AS PeersDY ON (
		PGDefs.CatSelector = PeersDY.Classification
		AND Funds.BaseCCYIso = PeersDY.CCY
		AND PeersDY.Sector = (CASE PGDefs.CatSelector
					WHEN 'Mstar' THEN PGDefs.MStarCat
					WHEN 'IMA' THEN PGDefs.IMACat
					WHEN 'GIF' THEN PGDefs.GIFCat
					WHEN 'ABI' THEN PGDefs.ABICat
					WHEN 'Custom' THEN PGDefs.CustomCat
					END)
		AND PeersDY.Year = FundsDY.Year
		) LEFT JOIN
	tbl_Desks AS Desks ON (Funds.OurTeam = Desks.Code)

WHERE	Funds.InceptionDate < CAST(CAST(FundsDY.Year-1 AS NVARCHAR(4)) + 'Dec 31' AS datetime)
	AND FundsDY.FundNP IS NOT NULL
	

UNION
SELECT	ID
	, Company
	, PrimaryObj
	, OurTeam
	, DeskName
	, OurPM
	, FundName
	, Inception
	, CloseDate
	, BenId
	, BenName
	, Classification +  ' - ' + PeerGroup AS PeersDef
	, RefDate
	, NPYtD/100 AS NPYtD
	, ProdRankYtD
	, ProdBetaYtD AS FundBeta
	, ProdAlphaYtD/100 AS FundAlpha
	, ProdTEYtD/100 AS FundTE
	, ProdStDYtD/100 AS FundSD
	, PeersNoYtD
	, PG1stQ_rYtD/100 AS PG1stQ_rYtD
	, PG3stQ_rYtD/100 AS PG3stQ_rYtD
	, PGAvg_rYtD/100 AS PGAvg_rYtD
	, PGMed_rYtD/100 AS PGMed_rYtD
	, BenYtD/100 AS BenYtD
	, BenStDYtD/100 AS BenSDYtD
	, CAST(ProdRankYtD AS float) / PeersNoYtD AS FundPercentile
	, dbo.fn_GetQuartile(CAST(ProdRankYtD AS float)/PeersNoYtD, 0) AS Quartile
	, (CASE WHEN BenYtD IS NULL THEN NULL 
		WHEN NPYtD > BenYtD THEN 1 
		ELSE 0 END) AS IsAheadBen

FROM	vw_AllPerfDataset
WHERE	RefDate = (SELECT MAX(RefDate) FROM vw_AllPerfDataset)
		AND YEAR((SELECT MAX(RefDate) FROM vw_AllPerfDataset)) > 
			(SELECT MAX(YEAR) FROM tbl_PeersPerfsDY)