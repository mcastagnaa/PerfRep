USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetBonusPoolPerfData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetBonusPoolPerfData
GO

CREATE PROCEDURE dbo.spS_GetBonusPoolPerfData
	@RefDate datetime

AS

DECLARE @BegY datetime
DECLARE @BegEo2y datetime
DECLARE @BegEo3y datetime

SET @BegY = DATEADD(month, -(MONTH(@RefDate) - 1) ,@RefDate)
SET @BegY = DATEADD(day, -DAY(@BegY), @BegY)
SET @BegEo2y = DATEADD(year, -1, @BegY)
SET @BegEo3y = DATEADD(year, -2, @BegY)

--SELECT @begY, @begEo2y, @begEo3y

SET NOCOUNT ON;

CREATE TABLE #FullSetTmp (
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

INSERT INTO #FullSetTmp
EXEC dbo.spS_GetPerfRawData @RefDate, 1, null, null

-------------------------------------------------------------------
-- BONUS POOL MODIFICATIONS OF PRODUCT ATTRIBUTES
-------------------------------------------------------------------

-- Modify Inception date 
UPDATE #FullSetTmp
SET Inception = '2010 Dec 6'
WHERE Id = 260

UPDATE #FullSetTmp
SET Inception = '2011 Mar 31'
WHERE Id = 249

UPDATE #FullSetTmp
SET Inception = '2010 Jun 10'
WHERE Id IN (247, 240, 251, 230)

-- Set relevant periods to null
UPDATE #FullSetTmp
SET ProdRankYtD = null
WHERE Inception > @BegY

UPDATE #FullSetTmp
SET ProdRankEo2y_TD = null
WHERE Inception > @BegEo2y

UPDATE #FullSetTmp
SET ProdRankEo3y_TD = null
WHERE Inception > @BegEo3y

UPDATE #FullSetTmp
SET ProdRank1y = null
WHERE DATEDIFF(month, Inception, @RefDate) < 12

UPDATE #FullSetTmp
SET ProdRank2y = null
WHERE DATEDIFF(month, Inception, @RefDate) < 24

UPDATE #FullSetTmp
SET ProdRank3y = null
WHERE DATEDIFF(month, Inception, @RefDate) < 36

UPDATE #FullSetTmp
SET ProdRank5y = null
WHERE DATEDIFF(month, Inception, @RefDate) < 60

-------------------------------------------------------------------

--SELECT * FROM #FullSET WHERE id IN (260, 249, 247, 240, 251, 230)

-------------------------------------------------------------------

SELECT	FS.*
	, Funds.BonusPool
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRank1y AS float)/VW.PGIRNum1y, 0) AS ProdIR1yQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRank2y AS float)/VW.PGIRNum2y, 0) AS ProdIR2yQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRank3y AS float)/VW.PGIRNum3y, 0) AS ProdIR3yQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRank5y AS float)/VW.PGIRNum5y, 0) AS ProdIR5yQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRankYtD AS float)/VW.PGIRNumYtD, 0) AS ProdIRYtDQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRankEo2y_TD AS float)/VW.PGIRNumEo2y_TD, 0) AS ProdIREo2y_TDQuart
	, dbo.fn_GetQuartile(CAST(VW.ProdIRRankEo3y_TD AS float)/VW.PGIRNumEo3y_TD, 0) AS ProdIREo3y_TDQuart

	, dbo.fn_GetQuartile(CAST(FS.ProdRank1y AS float)/FS.PeersNo1y, 0) AS Prod1yQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRank2y AS float)/FS.PeersNo2y, 0) AS Prod2yQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRank3y AS float)/FS.PeersNo3y, 0) AS Prod3yQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRank5y AS float)/FS.PeersNo5y, 0) AS Prod5yQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRankYtD AS float)/FS.PeersNoYtD, 0) AS ProdYtDQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRankEo2y_TD AS float)/FS.PeersNoEo2y_TD, 0) AS ProdEo2y_TDQuart
	, dbo.fn_GetQuartile(CAST(FS.ProdRankEo3y_TD AS float)/FS.PeersNoEo3y_TD, 0) AS ProdEo3y_TDQuart

INTO	#FullSet

FROM 	#FullSetTmp AS FS LEFT JOIN

	tbl_Products AS Funds ON (
		Funds.Id = FS.Id
		) LEFT JOIN
	vw_AllPerfDataset AS VW ON (
		FS.Id = VW.Id
		AND FS.RefDate = vw.RefDate
		)

WHERE	Funds.BonusPool IS NOT NULL

--SELECT * FROM #FullSet

-------------------------------------------------------------------

SELECT	SUM(CASE WHEN ProdYtDQuart + ProdIRYtDQuart = 10 THEN 0 ELSE 1 END) AS CountYtD
	, SUM(CASE WHEN ProdEo2y_TDQuart + ProdIREo2y_TDQuart = 10 THEN 0 ELSE 1 END) AS CountEO2y_TD
	, SUM(CASE WHEN ProdEo3y_TDQuart + ProdIREo3y_TDQuart = 10 THEN 0 ELSE 1 END) AS CountEO3y_TD
	, SUM(CASE WHEN Prod1yQuart + ProdIR1yQuart = 10 THEN 0 ELSE 1 END) AS Count1y
	, SUM(CASE WHEN Prod2yQuart + ProdIR2yQuart = 10 THEN 0 ELSE 1 END) AS Count2y
	, SUM(CASE WHEN Prod3yQuart + ProdIR3yQuart = 10 THEN 0 ELSE 1 END) AS Count3y
	, SUM(CASE WHEN Prod5yQuart + ProdIR5yQuart = 10 THEN 0 ELSE 1 END) AS Count5y

INTO	#Counts
FROM	#FullSet AS FSet

--SELECT * FROM #Counts


-------------------------------------------------------------------


SELECT	Fset.Id AS FundId
	, Fset.FundName 
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIRYtDQuart
		ELSE ProdYtDQuart END) AS QuartYtD
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIREo2y_TDQuart
		ELSE ProdEo2y_TDQuart END) AS QuartEo2y_TD
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIREo3y_TDQuart
		ELSE ProdEo3y_TDQuart END) AS QuartEo3y_TD
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIR1yQuart
		ELSE Prod1yQuart END) AS Quart1y
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIR2yQuart
		ELSE Prod2yQuart END) AS Quart2y
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIR3yQuart
		ELSE Prod3yQuart END) AS Quart3y
	, (CASE PrimaryObj
		WHEN 'IsraelsenVsPeers' THEN ProdIR5yQuart
		ELSE Prod5yQuart END) AS Quart5y

INTO	#Quartiles

FROM 	#FullSet AS Fset

WHERE	FSet.BonusPool IS NOT NULL

--SELECT * FROM #Quartiles

----------------------------------------------------------------------------------

CREATE TABLE #QuartVal (Quartile NVarchar(2), QuartNo int); 
INSERT INTO #QuartVal VALUES ('1Q', 1);
INSERT INTO #QuartVal VALUES ('2Q', 2);
INSERT INTO #QuartVal VALUES ('3Q', 3);
INSERT INTO #QuartVal VALUES ('4Q', 4);
INSERT INTO #QuartVal VALUES ('NA', 5);

----------------------------------------------------------------------------------


SELECT Quartile
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartYtD) AS [YtD]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartEo2y_TD) AS [Eo2y_TD]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartEo3y_TD) AS [Eo3y_TD]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1y) AS [1y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart2y) AS [2y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3y) AS [3y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart5y) AS [5y]
	, 'Numbs' AS Stat

FROM #QuartVal

UNION SELECT Quartile
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartYtD))/
		(SELECT CountYtD FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartEo2y_TD))/
		(SELECT CountEo2y_TD FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = QuartEo3y_TD))/
		(SELECT CountEo3y_TD FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1y))/
		(SELECT Count1y FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart2y))/
		(SELECT Count2y FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3y))/
		(SELECT Count3y FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart5y))/
		(SELECT Count5y FROM #Counts)
	, 'Percs' AS Stat

FROM #QuartVal

ORDER BY Stat

----------------------------------------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #FullSetTmp
DROP TABLE #Quartiles
DROP TABLE #QuartVal
DROP TABLE #Counts
GO
----------------------------------------------------------------------------------

GRANT EXECUTE ON spS_GetBonusPoolPerfData TO [OMAM\Compliance]

