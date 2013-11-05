USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetQuartilePerfDataRaw') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetQuartilePerfDataRaw
GO

CREATE PROCEDURE dbo.spS_GetQuartilePerfDataRaw
	@RefDate datetime

AS

DECLARE @BegY datetime
DECLARE @BegEo2y datetime
DECLARE @BegEo3y datetime

SET @BegY = DATEADD(month, -(MONTH(@RefDate) - 1) ,@RefDate)
SET @BegY = DATEADD(day, -DAY(@BegY), @BegY)
SET @BegEo2y = DATEADD(year, -1, @BegY)
SET @BegEo3y = DATEADD(year, -2, @BegY)

------------------------------------------------------------------------

SET NOCOUNT ON;

CREATE TABLE #FullSet(
Id Integer
,FundName nvarchar(150)
,ShortCode Nvarchar(15)
,Company NvarChar(15)
,BaseCCYIso NvarChar(3)
,Inception datetime
,BenCode  NvarChar(15)
,BenName NvarChar(100)
,PrimaryObj NvarChar(50)
,InvManager NvarChar(100)
,OurTeam NvarChar(100)
,OurPM NVarChar(100)
,OurAnalyst NVarChar(100)
,SoldAs NvarChar(100)
,InAs NvarChar(100)
,IUProduct NvarChar(50)
,Classification NvarChar(100)
,PeerGroup NvarChar(100)
,PeerGroupLabel NvarChar(100)
,RefDate datetime
,LastBusinessDay Datetime
,AuM float
,ProdTER float
,NP1m float
,NP3m float
,NP6m float
,NP1y float
,NP2y float
,NP3y float
,NP5y float
,NPYtD float
,[NPy-1] float
,[NPy-2] float
,[NPy-3] float
,[NPy-4] float
,[NPy-5] float
,NPEo2y_TD float
,NPEo3y_TD float
,NP_SI float
,NP2y_a float
,NP3y_a float
,NP5y_a float
,NPEo2y_TD_a float
,NPEo3y_TD_a float
,NP_SI_a float
,GP1m float
,GP3m float
,GP6m float
,GP1y float
,GP2y float
,GP3y float
,GP5y float
,GPYtD float
,[GPy-1] float
,[GPy-2] float
,[GPy-3] float
,[GPy-4] float
,[GPy-5] float
,GPEo2y_TD float
,GPEo3y_TD float
,GP_SI float
,GP2y_a float
,GP3y_a float
,GP5y_a float
,GPEo2y_TD_a float
,GPEo3y_TD_a float
,GP_SI_a float
,ProdRank1m float
,ProdRank3m float
,ProdRank6m float
,ProdRank1y float
,ProdRank2y float
,ProdRank3y float
,ProdRank5y float
,ProdRankYtD float
,[ProdRanky-1] float
,[ProdRanky-2] float
,[ProdRanky-3] float
,[ProdRanky-4] float
,[ProdRanky-5] float
,ProdRankEo2y_TD float
,ProdRankEo3y_TD float
,ProdRank_SI float
,Ben1m float
,Ben3m float
,Ben6m float
,Ben1y float
,Ben2y float
,Ben3y float
,Ben5y float
,BenYtD float
,[Beny-1] float
,[Beny-2] float
,[Beny-3] float
,[Beny-4] float
,[Beny-5] float
,BenEo2y_TD float
,BenEo3y_TD float
,Ben2y_a float
,Ben3y_a float
,Ben5y_a float
,BenEo2y_TD_a float
,BenEo3y_TD_a float
,Ben_SI float
,Ben_SI_a float
,PeersNo1m float
,PeersNo3m float
,PeersNo6m float
,PeersNo1y float
,PeersNo2y float
,PeersNo3y float
,PeersNo5y float
,PeersNoYtD float
,[PeersNoy-1] float
,[PeersNoy-2] float
,[PeersNoy-3] float
,[PeersNoy-4] float
,[PeersNoy-5] float
,PeersNoEo2y_TD float
,PeersNoEo3y_TD float
,PeersNo_SI float
,PG1stQ_r1m float
,PG1stQ_r3m float
,PG1stQ_r6m float
,PG1stQ_r1y float
,PG1stQ_r2y float
,PG1stQ_r3y float
,PG1stQ_r5y float
,PG1stQ_rYtD float
,[PG1stQ_ry-1] float
,[PG1stQ_ry-2] float
,[PG1stQ_ry-3]  float
,[PG1stQ_ry-4] float
,[PG1stQ_ry-5] float
,PG1stQ_rEo2y_TD float
,PG1stQ_rEo3y_TD float
,PG1stQ_r2y_a float
,PG1stQ_r3y_a float
,PG1stQ_r5y_a float
,PG1stQ_rEo2y_TD_a float
,PG1stQ_rEo3y_TD_a float
,PG1stQ_r_SI float
,PG1stQ_r_SI_a float
,PG3stQ_r1m float
,PG3stQ_r3m float
,PG3stQ_r6m float
,PG3stQ_r1y float
,PG3stQ_r2y float
,PG3stQ_r3y float
,PG3stQ_r5y float                                   
,PG3stQ_rYtD float
,[PG3stQ_ry-1] float
,[PG3stQ_ry-2] float
,[PG3stQ_ry-3] float
,[PG3stQ_ry-4] float
,[PG3stQ_ry-5] float
,PG3stQ_rEo2y_TD float
,PG3stQ_rEo3y_TD float
,PG3stQ_r2y_a float
,PG3stQ_r3y_a float
,PG3stQ_r5y_a float
,PG3stQ_rEo2y_TD_a float
,PG3stQ_rEo3y_TD_a float
,PG3stQ_r_SI float
,PG3stQ_r_SI_a float
,PGavg_r1m float
,PGavg_r3m float
,PGavg_r6m float
,PGavg_r1y float
,PGavg_r2y float
,PGavg_r3y float
,PGavg_r5y float
,PGavg_rYtD float
,[PGavg_ry-1] float
,[PGavg_ry-2] float
,[PGavg_ry-3] float
,[PGavg_ry-4] float
,[PGavg_ry-5] float
,PGavg_rEo2y_TD float
,PGavg_rEo3y_TD float
,PGavg_r2y_a float
,PGavg_r3y_a float
,PGavg_r5y_a float
,PGavg_rEo2y_TD_a float
,PGavg_rEo3y_TD_a float
,PGavg_r_SI float
,PGavg_r_SI_a float
,PGmed_r1m float
,PGmed_r3m float
,PGmed_r6m float
,PGmed_r1y float
,PGmed_r2y float
,PGmed_r3y float
,PGmed_r5y float
,PGmed_rYtD float
,[PGmed_ry-1] float
,[PGmed_ry-2] float
,[PGmed_ry-3] float
,[PGmed_ry-4] float
,[PGmed_ry-5] float
,PGmed_rEo2y_TD float
,PGmed_rEo3y_TD float
,PGmed_r2y_a float
,PGmed_r3y_a float
,PGmed_r5y_a float
,PGmed_rEo2y_TD_a float
,PGmed_rEo3y_TD_a float
,PGmed_r_SI float
,PGmed_r_SI_a float
)

-------------------------------------------------------------------

INSERT INTO #FullSet
EXEC dbo.spS_GetPerfRawData @RefDate, 1, null, null

--SELECT * FROM #FullSet WHERE Id = 261

-------------------------------------------------------------------

SELECT	Fset.Id AS FundId
	, Fset.Company
	, Fset.OurTeam
	, Fset.FundName 
	, (CASE
		WHEN Spectrum.FundId IS NOT NULL THEN null 
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 1 THEN 1
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 2 THEN 2
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 3 THEN 3
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart1m
	, (CASE
		WHEN Spectrum.FundId IS NOT NULL THEN null 
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 1 THEN 1
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 2 THEN 2
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 3 THEN 3
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart3m
	, (CASE
		WHEN Spectrum.QuartYtD IS NOT NULL THEN Spectrum.QuartYtD 
		WHEN (ProdRankYtD/PeersNoYtD)/0.25 <= 1 THEN 1
		WHEN (ProdRankYtD/PeersNoYtD)/0.25 <= 2 THEN 2
		WHEN (ProdRankYtD/PeersNoYtD)/0.25 <= 3 THEN 3
		WHEN (ProdRankYtD/PeersNoYtD)/0.25 <= 4 THEN 4
		ELSE null END) AS QuartYtD
	, (CASE 
		WHEN Spectrum.Quart1y IS NOT NULL THEN Spectrum.Quart1y
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 1 THEN 1
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 2 THEN 2
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 3 THEN 3
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart1y
	, (CASE 
		WHEN Spectrum.Quart2y IS NOT NULL THEN Spectrum.Quart2y
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 1 THEN 1
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 2 THEN 2
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 3 THEN 3
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart2y
	, (CASE 
		WHEN Spectrum.Quart3y IS NOT NULL THEN Spectrum.Quart3y
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 1 THEN 1
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 2 THEN 2
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 3 THEN 3
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart3y
	, (CASE 
		WHEN Spectrum.Quart5y IS NOT NULL THEN Spectrum.Quart5y
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 1 THEN 1
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 2 THEN 2
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 3 THEN 3
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 4 THEN 4
		ELSE null END) AS Quart5y
	, (CASE 
		WHEN Spectrum.QuartEo2y_TD IS NOT NULL THEN Spectrum.QuartEo2y_TD
		WHEN (ProdRankEo2y_TD/PeersNoEo2y_TD)/0.25 <= 1 THEN 1
		WHEN (ProdRankEo2y_TD/PeersNoEo2y_TD)/0.25 <= 2 THEN 2
		WHEN (ProdRankEo2y_TD/PeersNoEo2y_TD)/0.25 <= 3 THEN 3
		WHEN (ProdRankEo2y_TD/PeersNoEo2y_TD)/0.25 <= 4 THEN 4
		ELSE null END) AS QuartEo2y_TD
	, (CASE 
		WHEN Spectrum.QuartEo3y_TD IS NOT NULL THEN Spectrum.QuartEo3y_TD
		WHEN (ProdRankEo3y_TD/PeersNoEo3y_TD)/0.25 <= 1 THEN 1
		WHEN (ProdRankEo3y_TD/PeersNoEo3y_TD)/0.25 <= 2 THEN 2
		WHEN (ProdRankEo3y_TD/PeersNoEo3y_TD)/0.25 <= 3 THEN 3
		WHEN (ProdRankEo3y_TD/PeersNoEo3y_TD)/0.25 <= 4 THEN 4
		ELSE null END) AS QuartEo3y_TD
	
FROM 	#FullSet AS Fset LEFT JOIN
	[OMAM\Matteoc].tbl_SpectrumQuart AS Spectrum ON (
		Fset.Id = Spectrum.FundId
		AND Spectrum.RefDate = Fset.RefDate
		)

WHERE	(PeerGroup IS NOT NULL) OR (Spectrum.FundId IS NOT NULL)
-- JUST TO ACCOMODATE Finance REQUIREMENT THIS WILL INCLUDE SPECTRUM. IT SHOULDN'T BE LIKE THAT

	
----------------------------------------------------------------------------------

DROP TABLE #FullSet
GO
----------------------------------------------------------------------------------

GRANT EXECUTE ON dbo.spS_GetQuartilePerfDataRaw TO [OMAM\Compliance]

