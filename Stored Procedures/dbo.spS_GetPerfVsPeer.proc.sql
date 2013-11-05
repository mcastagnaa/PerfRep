USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPerfVsPeer') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPerfVsPeer
GO

CREATE PROCEDURE dbo.spS_GetPerfVsPeer
	@RefDate datetime
	, @Filter integer
	, @Company nvarchar(50)
	, @Desk nvarchar(50)

AS

DECLARE @NoFunds float

SET NOCOUNT ON;

CREATE TABLE #FullSet (
Id Integer
,FundName nvarchar(150)
,ShortCode Nvarchar(20)
,Company NvarChar(15)
,BaseCCYIso NvarChar(3)
,Inception datetime
,LastPMChange datetime
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
EXEC dbo.spS_GetPerfRawData @RefDate, @Filter, @Company, @Desk

-------------------------------------------------------------------


SELECT	Fset.Id AS FundId
	, Fset.FundName 
	, Fset.PeerGroupLabel
	, Fset.ShortCode
	, Fset.Company 
	, FSet.OurPM AS PM
	, FSet.IUProduct 
	, FSet.OurTeam AS Desk
	, Fset.PrimaryObj 
	, (CASE WHEN ProdRank1m IS NULL THEN NULL
		WHEN (ProdRank1m/PeersNo1m) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead1m
	, (CASE WHEN ProdRank3m IS NULL THEN NULL
		WHEN (ProdRank3m/PeersNo3m) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead3m
	, (CASE WHEN ProdRank6m IS NULL THEN NULL
		WHEN (ProdRank6m/PeersNo6m) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead6m
	, (CASE WHEN ProdRank1y IS NULL THEN NULL
		WHEN (ProdRank1y/PeersNo1y) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead1y
	, (CASE WHEN ProdRank2y IS NULL THEN NULL
		WHEN (ProdRank2y/PeersNo2y) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead2y
	, (CASE WHEN ProdRank3y IS NULL THEN NULL
		WHEN (ProdRank3y/PeersNo3y) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead3y
	, (CASE WHEN ProdRank5y IS NULL THEN NULL
		WHEN (ProdRank5y/PeersNo5y) <= 0.5 THEN 1
		ELSE 0 END) AS Ahead5y
	, (CASE WHEN ProdRankYtD IS NULL THEN NULL
		WHEN (ProdRankYtD/PeersNoYtD) <= 0.5 THEN 1
		ELSE 0 END) AS AheadYtD
	, (CASE WHEN ProdRankEo2y_TD IS NULL THEN NULL
		WHEN (ProdRankEo2y_TD/PeersNoEo2y_TD) <= 0.5 THEN 1
		ELSE 0 END) AS AheadEo2y_TD
	, (CASE WHEN ProdRankEo3y_TD IS NULL THEN NULL
		WHEN (ProdRankEo3y_TD/PeersNoEo3y_TD) <= 0.5 THEN 1
		ELSE 0 END) AS AheadEo3y_TD
	, (CASE WHEN ProdRank_SI IS NULL THEN NULL
		WHEN (ProdRank_SI/PeersNo_SI) <= 0.5 THEN 1
		ELSE 0 END) AS AheadSI

INTO	#FundsAhead

FROM #FullSet AS Fset
WHERE	Fset.BenCode IS NOT NULL

----------------------------------------------------------------------------------
SELECT	'All Funds' AS Desk
	, SUM(CASE WHEN Ahead1m IS NULL THEN 0 ELSE 1 END) AS Count1m
	, SUM(CASE WHEN Ahead3m IS NULL THEN 0 ELSE 1 END) AS Count3m
	, SUM(CASE WHEN Ahead6m IS NULL THEN 0 ELSE 1 END) AS Count6m
	, SUM(CASE WHEN Ahead1y IS NULL THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Ahead2y IS NULL THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Ahead3y IS NULL THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Ahead5y IS NULL THEN 0 ELSE 1 END) AS Count5y
	, SUM(CASE WHEN AheadYtD IS NULL THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN AheadEo2y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo2y_TD
	, SUM(CASE WHEN AheadEo3y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo3y_TD
	, SUM(CASE WHEN AheadSI IS NULL THEN 0 ELSE 1 END) AS CountSI

INTO	#FundsCount

FROM 	#FundsAhead

----------------------------------------------------------------------------------


SELECT	Desk
	, SUM(CASE WHEN Ahead1m IS NULL THEN 0 ELSE 1 END) AS Count1m
	, SUM(CASE WHEN Ahead3m IS NULL THEN 0 ELSE 1 END) AS Count3m
	, SUM(CASE WHEN Ahead6m IS NULL THEN 0 ELSE 1 END) AS Count6m
	, SUM(CASE WHEN Ahead1y IS NULL THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Ahead2y IS NULL THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Ahead3y IS NULL THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Ahead5y IS NULL THEN 0 ELSE 1 END) AS Count5y
	, SUM(CASE WHEN AheadYtD IS NULL THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN AheadEo2y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo2y_TD
	, SUM(CASE WHEN AheadEo3y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo3y_TD
	, SUM(CASE WHEN AheadSI IS NULL THEN 0 ELSE 1 END) AS CountSI

INTO	#DeskCounts

FROM 	#FundsAhead

GROUP BY 	Desk

----------------------------------------------------------------------------------

SELECT	Company
	, SUM(CASE WHEN Ahead1m IS NULL THEN 0 ELSE 1 END) AS Count1m
	, SUM(CASE WHEN Ahead3m IS NULL THEN 0 ELSE 1 END) AS Count3m
	, SUM(CASE WHEN Ahead6m IS NULL THEN 0 ELSE 1 END) AS Count6m
	, SUM(CASE WHEN Ahead1y IS NULL THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Ahead2y IS NULL THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Ahead3y IS NULL THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Ahead5y IS NULL THEN 0 ELSE 1 END) AS Count5y
	, SUM(CASE WHEN AheadYtD IS NULL THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN AheadEo2y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo2y_TD
	, SUM(CASE WHEN AheadEo3y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo3y_TD
	, SUM(CASE WHEN AheadSI IS NULL THEN 0 ELSE 1 END) AS CountSI

INTO	#CompanyCounts

FROM 	#FundsAhead

GROUP BY 	Company

----------------------------------------------------------------------------------

SELECT	PM
	, SUM(CASE WHEN Ahead1m IS NULL THEN 0 ELSE 1 END) AS Count1m
	, SUM(CASE WHEN Ahead3m IS NULL THEN 0 ELSE 1 END) AS Count3m
	, SUM(CASE WHEN Ahead6m IS NULL THEN 0 ELSE 1 END) AS Count6m
	, SUM(CASE WHEN Ahead1y IS NULL THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Ahead2y IS NULL THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Ahead3y IS NULL THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Ahead5y IS NULL THEN 0 ELSE 1 END) AS Count5y
	, SUM(CASE WHEN AheadYtD IS NULL THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN AheadEo2y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo2y_TD
	, SUM(CASE WHEN AheadEo3y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo3y_TD
	, SUM(CASE WHEN AheadSI IS NULL THEN 0 ELSE 1 END) AS CountSI

INTO	#PMCounts

FROM 	#FundsAhead

GROUP BY 	PM

----------------------------------------------------------------------------------

SELECT	IUProduct
	, SUM(CASE WHEN Ahead1m IS NULL THEN 0 ELSE 1 END) AS Count1m
	, SUM(CASE WHEN Ahead3m IS NULL THEN 0 ELSE 1 END) AS Count3m
	, SUM(CASE WHEN Ahead6m IS NULL THEN 0 ELSE 1 END) AS Count6m
	, SUM(CASE WHEN Ahead1y IS NULL THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Ahead2y IS NULL THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Ahead3y IS NULL THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Ahead5y IS NULL THEN 0 ELSE 1 END) AS Count5y
	, SUM(CASE WHEN AheadYtD IS NULL THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN AheadEo2y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo2y_TD
	, SUM(CASE WHEN AheadEo3y_TD IS NULL THEN 0 ELSE 1 END) AS CountEo3y_TD
	, SUM(CASE WHEN AheadSI IS NULL THEN 0 ELSE 1 END) AS CountSI

INTO	#IUPsCounts

FROM 	#FundsAhead

GROUP BY 	IUProduct

----------------------------------------------------------------------------------

SELECT 	'Desk' AS Dimension
	, FA.Desk AS Type
	, SUM(ISNULL(FA.Ahead1m,0)) ACount1m
	, DC.Count1m
	, CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0) AS ACountPer1m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1m,0)))  + '/' + CONVERT(varchar, DC.Count1m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0)*100, 0))
		 + '%)' AS Label1m

	, SUM(ISNULL(FA.Ahead3m,0)) ACount3m
	, DC.Count3m
	, CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0) AS ACountPer3m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3m,0)))  + '/' + CONVERT(varchar, DC.Count3m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0)*100, 0))
		 + '%)' AS Label3m

	, SUM(ISNULL(FA.Ahead6m,0)) ACount6m
	, DC.Count6m
	, CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0) AS ACountPer6m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead6m,0)))  + '/' + CONVERT(varchar, DC.Count6m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0)*100, 0))
		 + '%)' AS Label6m


	, SUM(ISNULL(FA.Ahead1y,0)) ACount1y
	, DC.Count1y
	, CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0) AS ACountPer1y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1y,0)))  + '/' + CONVERT(varchar, DC.Count1y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0)*100, 0))
		 + '%)' AS Label1y

	, SUM(ISNULL(FA.Ahead2y,0)) ACount2y
	, DC.Count2y
	, CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0) AS ACountPer2y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead2y,0)))  + '/' + CONVERT(varchar, DC.Count2y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0)*100, 0))
		 + '%)' AS Label2y

	, SUM(ISNULL(FA.Ahead1y,0)) ACount3y
	, DC.Count3y
	, CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0) AS ACountPer3y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3y,0)))  + '/' + CONVERT(varchar, DC.Count3y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0)*100, 0))
		 + '%)' AS Label3y

	, SUM(ISNULL(FA.Ahead5y,0)) ACount5y
	, DC.Count5y
	, CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0) AS ACountPer5y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead5y,0)))  + '/' + CONVERT(varchar, DC.Count5y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0)*100, 0))
		 + '%)' AS Label5y

	, SUM(ISNULL(FA.AheadYtD,0)) ACountYtD
	, DC.CountYtD
	, CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0) AS ACountPerYtD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadYtD,0)))  + '/' + CONVERT(varchar, DC.CountYtD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0)*100, 0))
		 + '%)' AS LabelYtD

	, SUM(ISNULL(FA.AheadEo2y_TD,0)) ACountEo2y_TD
	, DC.CountEo2y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0) AS ACountPerEo2y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo2y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo2y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0)*100, 0))
		 + '%)' AS LabelEo2y_TD

	, SUM(ISNULL(FA.AheadEo3y_TD,0)) ACountEo3y_TD
	, DC.CountEo3y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0) AS ACountPerEo3y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo3y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo3y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0)*100, 0))
		 + '%)' AS LabelEo3y_TD


	, SUM(ISNULL(FA.AheadSI,0)) ACountSI
	, DC.CountSI
	, CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI,0) AS ACountPerSI
	, CONVERT(varchar, SUM(ISNULL(FA.AheadSI,0)))  + '/' + CONVERT(varchar, DC.CountSI) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI, 0)*100, 0))
		 + '%)' AS LabelSI

INTO	#DesksSet

FROM	#FundsAhead AS FA LEFT JOIN
	#DeskCounts AS DC ON (DC.Desk = FA.Desk)

GROUP BY	FA.Desk
		, DC.Count1m
		, DC.Count3m
		, DC.Count6m
		, DC.Count1y
		, DC.Count2y
		, DC.Count3y
		, DC.Count5y
		, DC.CountYtD
		, DC.CountEo2y_TD
		, DC.CountEo3y_TD
		, DC.CountSI


----------------------------------------------------------------------------------

SELECT 	'Company' AS Dimension
	, FA.Company

	, SUM(ISNULL(FA.Ahead1m,0)) ACount1m
	, DC.Count1m
	, CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0) AS ACountPer1m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1m,0)))  + '/' + CONVERT(varchar, DC.Count1m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0)*100, 0))
		 + '%)' AS Label1m

	, SUM(ISNULL(FA.Ahead3m,0)) ACount3m
	, DC.Count3m
	, CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0) AS ACountPer3m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3m,0)))  + '/' + CONVERT(varchar, DC.Count3m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0)*100, 0))
		 + '%)' AS Label3m

	, SUM(ISNULL(FA.Ahead6m,0)) ACount6m
	, DC.Count6m
	, CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0) AS ACountPer6m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead6m,0)))  + '/' + CONVERT(varchar, DC.Count6m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0)*100, 0))
		 + '%)' AS Label6m


	, SUM(ISNULL(FA.Ahead1y,0)) ACount1y
	, DC.Count1y
	, CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0) AS ACountPer1y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1y,0)))  + '/' + CONVERT(varchar, DC.Count1y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0)*100, 0))
		 + '%)' AS Label1y

	, SUM(ISNULL(FA.Ahead2y,0)) ACount2y
	, DC.Count2y
	, CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0) AS ACountPer2y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead2y,0)))  + '/' + CONVERT(varchar, DC.Count2y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0)*100, 0))
		 + '%)' AS Label2y

	, SUM(ISNULL(FA.Ahead1y,0)) ACount3y
	, DC.Count3y
	, CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0) AS ACountPer3y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3y,0)))  + '/' + CONVERT(varchar, DC.Count3y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0)*100, 0))
		 + '%)' AS Label3y

	, SUM(ISNULL(FA.Ahead5y,0)) ACount5y
	, DC.Count5y
	, CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0) AS ACountPer5y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead5y,0)))  + '/' + CONVERT(varchar, DC.Count5y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0)*100, 0))
		 + '%)' AS Label5y

	, SUM(ISNULL(FA.AheadYtD,0)) ACountYtD
	, DC.CountYtD
	, CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0) AS ACountPerYtD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadYtD,0)))  + '/' + CONVERT(varchar, DC.CountYtD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0)*100, 0))
		 + '%)' AS LabelYtD

	, SUM(ISNULL(FA.AheadEo2y_TD,0)) ACountEo2y_TD
	, DC.CountEo2y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0) AS ACountPerEo2y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo2y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo2y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0)*100, 0))
		 + '%)' AS LabelEo2y_TD

	, SUM(ISNULL(FA.AheadEo3y_TD,0)) ACountEo3y_TD
	, DC.CountEo3y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0) AS ACountPerEo3y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo3y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo3y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0)*100, 0))
		 + '%)' AS LabelEo3y_TD


	, SUM(ISNULL(FA.AheadSI,0)) ACountSI
	, DC.CountSI
	, CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI,0) AS ACountPerSI
	, CONVERT(varchar, SUM(ISNULL(FA.AheadSI,0)))  + '/' + CONVERT(varchar, DC.CountSI) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI, 0)*100, 0))
		 + '%)' AS LabelSI


INTO	#CompaniesSet

FROM	#FundsAhead AS FA LEFT JOIN
	#CompanyCounts AS DC ON (DC.Company = FA.Company)

GROUP BY	FA.Company
		, DC.Count1m
		, DC.Count3m
		, DC.Count6m
		, DC.Count1y
		, DC.Count2y
		, DC.Count3y
		, DC.Count5y
		, DC.CountYtD
		, DC.CountEo2y_TD
		, DC.CountEo3y_TD
		, DC.CountSI



----------------------------------------------------------------------------------

SELECT 	'PM' AS Dimension
	, FA.PM

	, SUM(ISNULL(FA.Ahead1m,0)) ACount1m
	, DC.Count1m
	, CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0) AS ACountPer1m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1m,0)))  + '/' + CONVERT(varchar, DC.Count1m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0)*100, 0))
		 + '%)' AS Label1m

	, SUM(ISNULL(FA.Ahead3m,0)) ACount3m
	, DC.Count3m
	, CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0) AS ACountPer3m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3m,0)))  + '/' + CONVERT(varchar, DC.Count3m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0)*100, 0))
		 + '%)' AS Label3m

	, SUM(ISNULL(FA.Ahead6m,0)) ACount6m
	, DC.Count6m
	, CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0) AS ACountPer6m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead6m,0)))  + '/' + CONVERT(varchar, DC.Count6m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0)*100, 0))
		 + '%)' AS Label6m


	, SUM(ISNULL(FA.Ahead1y,0)) ACount1y
	, DC.Count1y
	, CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0) AS ACountPer1y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1y,0)))  + '/' + CONVERT(varchar, DC.Count1y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0)*100, 0))
		 + '%)' AS Label1y

	, SUM(ISNULL(FA.Ahead2y,0)) ACount2y
	, DC.Count2y
	, CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0) AS ACountPer2y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead2y,0)))  + '/' + CONVERT(varchar, DC.Count2y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0)*100, 0))
		 + '%)' AS Label2y

	, SUM(ISNULL(FA.Ahead1y,0)) ACount3y
	, DC.Count3y
	, CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0) AS ACountPer3y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3y,0)))  + '/' + CONVERT(varchar, DC.Count3y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0)*100, 0))
		 + '%)' AS Label3y

	, SUM(ISNULL(FA.Ahead5y,0)) ACount5y
	, DC.Count5y
	, CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0) AS ACountPer5y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead5y,0)))  + '/' + CONVERT(varchar, DC.Count5y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0)*100, 0))
		 + '%)' AS Label5y

	, SUM(ISNULL(FA.AheadYtD,0)) ACountYtD
	, DC.CountYtD
	, CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0) AS ACountPerYtD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadYtD,0)))  + '/' + CONVERT(varchar, DC.CountYtD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0)*100, 0))
		 + '%)' AS LabelYtD

	, SUM(ISNULL(FA.AheadEo2y_TD,0)) ACountEo2y_TD
	, DC.CountEo2y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0) AS ACountPerEo2y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo2y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo2y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0)*100, 0))
		 + '%)' AS LabelEo2y_TD

	, SUM(ISNULL(FA.AheadEo3y_TD,0)) ACountEo3y_TD
	, DC.CountEo3y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0) AS ACountPerEo3y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo3y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo3y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0)*100, 0))
		 + '%)' AS LabelEo3y_TD


	, SUM(ISNULL(FA.AheadSI,0)) ACountSI
	, DC.CountSI
	, CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI,0) AS ACountPerSI
	, CONVERT(varchar, SUM(ISNULL(FA.AheadSI,0)))  + '/' + CONVERT(varchar, DC.CountSI) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI, 0)*100, 0))
		 + '%)' AS LabelSI

INTO	#PMsSet

FROM	#FundsAhead AS FA LEFT JOIN
	#PMCounts AS DC ON (DC.PM = FA.PM)

GROUP BY	FA.PM
		, DC.Count1m
		, DC.Count3m
		, DC.Count6m
		, DC.Count1y
		, DC.Count2y
		, DC.Count3y
		, DC.Count5y
		, DC.CountYtD
		, DC.CountEo2y_TD
		, DC.CountEo3y_TD
		, DC.CountSI

----------------------------------------------------------------------------------

SELECT 	'IU Product' AS Dimension
	, FA.IUProduct AS Type
	, SUM(ISNULL(FA.Ahead1m,0)) ACount1m
	, DC.Count1m
	, CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0) AS ACountPer1m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1m,0)))  + '/' + CONVERT(varchar, DC.Count1m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0)*100, 0))
		 + '%)' AS Label1m

	, SUM(ISNULL(FA.Ahead3m,0)) ACount3m
	, DC.Count3m
	, CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0) AS ACountPer3m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3m,0)))  + '/' + CONVERT(varchar, DC.Count3m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0)*100, 0))
		 + '%)' AS Label3m

	, SUM(ISNULL(FA.Ahead6m,0)) ACount6m
	, DC.Count6m
	, CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0) AS ACountPer6m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead6m,0)))  + '/' + CONVERT(varchar, DC.Count6m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0)*100, 0))
		 + '%)' AS Label6m


	, SUM(ISNULL(FA.Ahead1y,0)) ACount1y
	, DC.Count1y
	, CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0) AS ACountPer1y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1y,0)))  + '/' + CONVERT(varchar, DC.Count1y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0)*100, 0))
		 + '%)' AS Label1y

	, SUM(ISNULL(FA.Ahead2y,0)) ACount2y
	, DC.Count2y
	, CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0) AS ACountPer2y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead2y,0)))  + '/' + CONVERT(varchar, DC.Count2y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0)*100, 0))
		 + '%)' AS Label2y

	, SUM(ISNULL(FA.Ahead1y,0)) ACount3y
	, DC.Count3y
	, CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0) AS ACountPer3y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3y,0)))  + '/' + CONVERT(varchar, DC.Count3y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0)*100, 0))
		 + '%)' AS Label3y

	, SUM(ISNULL(FA.Ahead5y,0)) ACount5y
	, DC.Count5y
	, CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0) AS ACountPer5y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead5y,0)))  + '/' + CONVERT(varchar, DC.Count5y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0)*100, 0))
		 + '%)' AS Label5y

	, SUM(ISNULL(FA.AheadYtD,0)) ACountYtD
	, DC.CountYtD
	, CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0) AS ACountPerYtD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadYtD,0)))  + '/' + CONVERT(varchar, DC.CountYtD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0)*100, 0))
		 + '%)' AS LabelYtD

	, SUM(ISNULL(FA.AheadEo2y_TD,0)) ACountEo2y_TD
	, DC.CountEo2y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0) AS ACountPerEo2y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo2y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo2y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0)*100, 0))
		 + '%)' AS LabelEo2y_TD

	, SUM(ISNULL(FA.AheadEo3y_TD,0)) ACountEo3y_TD
	, DC.CountEo3y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0) AS ACountPerEo3y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo3y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo3y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0)*100, 0))
		 + '%)' AS LabelEo3y_TD


	, SUM(ISNULL(FA.AheadSI,0)) ACountSI
	, DC.CountSI
	, CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI,0) AS ACountPerSI
	, CONVERT(varchar, SUM(ISNULL(FA.AheadSI,0)))  + '/' + CONVERT(varchar, DC.CountSI) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI, 0)*100, 0))
		 + '%)' AS LabelSI

INTO	#IUProdsSet

FROM	#FundsAhead AS FA LEFT JOIN
	#IUPsCounts AS DC ON (DC.IUProduct = FA.IUProduct)

GROUP BY	FA.IUProduct
		, DC.Count1m
		, DC.Count3m
		, DC.Count6m
		, DC.Count1y
		, DC.Count2y
		, DC.Count3y
		, DC.Count5y
		, DC.CountYtD
		, DC.CountEo2y_TD
		, DC.CountEo3y_TD
		, DC.CountSI


----------------------------------------------------------------------------------


SELECT 	'Company' AS Dimension
	, 'All funds' AS Type
	, SUM(ISNULL(FA.Ahead1m,0)) ACount1m
	, DC.Count1m
	, CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0) AS ACountPer1m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1m,0)))  + '/' + CONVERT(varchar, DC.Count1m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1m,0)))/NULLIF(DC.Count1m,0)*100, 0))
		 + '%)' AS Label1m

	, SUM(ISNULL(FA.Ahead3m,0)) ACount3m
	, DC.Count3m
	, CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0) AS ACountPer3m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3m,0)))  + '/' + CONVERT(varchar, DC.Count3m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3m,0)))/NULLIF(DC.Count3m,0)*100, 0))
		 + '%)' AS Label3m

	, SUM(ISNULL(FA.Ahead6m,0)) ACount6m
	, DC.Count6m
	, CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0) AS ACountPer6m
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead6m,0)))  + '/' + CONVERT(varchar, DC.Count6m) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead6m,0)))/NULLIF(DC.Count6m,0)*100, 0))
		 + '%)' AS Label6m


	, SUM(ISNULL(FA.Ahead1y,0)) ACount1y
	, DC.Count1y
	, CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0) AS ACountPer1y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead1y,0)))  + '/' + CONVERT(varchar, DC.Count1y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead1y,0)))/NULLIF(DC.Count1y,0)*100, 0))
		 + '%)' AS Label1y

	, SUM(ISNULL(FA.Ahead2y,0)) ACount2y
	, DC.Count2y
	, CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0) AS ACountPer2y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead2y,0)))  + '/' + CONVERT(varchar, DC.Count2y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead2y,0)))/NULLIF(DC.Count2y,0)*100, 0))
		 + '%)' AS Label2y

	, SUM(ISNULL(FA.Ahead1y,0)) ACount3y
	, DC.Count3y
	, CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0) AS ACountPer3y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead3y,0)))  + '/' + CONVERT(varchar, DC.Count3y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead3y,0)))/NULLIF(DC.Count3y,0)*100, 0))
		 + '%)' AS Label3y

	, SUM(ISNULL(FA.Ahead5y,0)) ACount5y
	, DC.Count5y
	, CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0) AS ACountPer5y
	, CONVERT(varchar, SUM(ISNULL(FA.Ahead5y,0)))  + '/' + CONVERT(varchar, DC.Count5y) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.Ahead5y,0)))/NULLIF(DC.Count5y,0)*100, 0))
		 + '%)' AS Label5y

	, SUM(ISNULL(FA.AheadYtD,0)) ACountYtD
	, DC.CountYtD
	, CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0) AS ACountPerYtD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadYtD,0)))  + '/' + CONVERT(varchar, DC.CountYtD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadYtD,0)))/NULLIF(DC.CountYtD,0)*100, 0))
		 + '%)' AS LabelYtD

	, SUM(ISNULL(FA.AheadEo2y_TD,0)) ACountEo2y_TD
	, DC.CountEo2y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0) AS ACountPerEo2y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo2y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo2y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo2y_TD,0)))/NULLIF(DC.CountEo2y_TD,0)*100, 0))
		 + '%)' AS LabelEo2y_TD

	, SUM(ISNULL(FA.AheadEo3y_TD,0)) ACountEo3y_TD
	, DC.CountEo3y_TD
	, CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0) AS ACountPerEo3y_TD
	, CONVERT(varchar, SUM(ISNULL(FA.AheadEo3y_TD,0)))  + '/' + CONVERT(varchar, DC.CountEo3y_TD) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadEo3y_TD,0)))/NULLIF(DC.CountEo3y_TD,0)*100, 0))
		 + '%)' AS LabelEo3y_TD


	, SUM(ISNULL(FA.AheadSI,0)) ACountSI
	, DC.CountSI
	, CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI,0) AS ACountPerSI
	, CONVERT(varchar, SUM(ISNULL(FA.AheadSI,0)))  + '/' + CONVERT(varchar, DC.CountSI) +
	' (' + 	
	CONVERT(varchar, ROUND(CONVERT(float, SUM(ISNULL(FA.AheadSI,0)))/NULLIF(DC.CountSI, 0)*100, 0))
		 + '%)' AS LabelSI

INTO	#AllProdsSet

FROM	#FundsAhead AS FA 
	, #FundsCount AS DC

GROUP BY	DC.Count1m
		, DC.Count3m
		, DC.Count6m
		, DC.Count1y
		, DC.Count2y
		, DC.Count3y
		, DC.Count5y
		, DC.CountYtD
		, DC.CountEo2y_TD
		, DC.CountEo3y_TD
		, DC.CountSI


----------------------------------------------------------------------------------


SELECT * FROM #DesksSet
UNION
SELECT * FROM #IUProdsSet
UNION 
SELECT * FROM #AllProdsSet
UNION 
SELECT * FROM #CompaniesSet
UNION
SELECT * FROM #PMsSet
----------------------------------------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #FundsAhead
DROP TABLE #DesksSet
DROP TABLE #DeskCounts
DROP TABLE #CompaniesSet
DROP TABLE #CompanyCounts
DROP TABLE #PMsSet
DROP TABLE #PMCounts
DROP TABLE #IUProdsSet
DROP TABLE #IUPsCounts
DROP TABLE #AllProdsSet
DROP TABLE #FundsCount

GO

----------------------------------------------------------------------------------

GRANT EXECUTE ON spS_GetPerfVsPeer TO [OMAM\Compliance]

