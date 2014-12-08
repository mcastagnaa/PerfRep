USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetQuartilePerfData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetQuartilePerfData
GO

CREATE PROCEDURE dbo.spS_GetQuartilePerfData
	@RefDate datetime
	, @Filter integer
	, @Company nvarchar(50)
	, @Desk nvarchar(50)

AS

DECLARE @NoFunds float

SET NOCOUNT ON;

CREATE TABLE #FullSet (
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
EXEC dbo.spS_GetPerfRawData @RefDate, @Filter, @Company, @Desk

-------------------------------------------------------------------

SET @NoFunds = (SELECT COUNT(Id) FROM #FullSet WHERE PeerGroup IS NOT NULL)

-------------------------------------------------------------------

SELECT SUM((CASE WHEN ProdRank1m/PeersNo1m <= 1 THEN 1 ELSE 0 END)) AS Count1m
	, SUM((CASE WHEN ProdRank3m/PeersNo3m <= 1 THEN 1 ELSE 0 END)) AS Count3m
	, SUM((CASE WHEN ProdRank6m/PeersNo6m <= 1 THEN 1 ELSE 0 END)) AS Count6m
	, SUM((CASE WHEN ProdRank1y/PeersNo1y <= 1 THEN 1 ELSE 0 END)) AS Count1y
	, SUM((CASE WHEN ProdRank2y/PeersNo2y <= 1 THEN 1 ELSE 0 END)) AS Count2y
	, SUM((CASE WHEN ProdRank3y/PeersNo3y <= 1 THEN 1 ELSE 0 END)) AS Count3y
	, SUM((CASE WHEN ProdRank5y/PeersNo5y <= 1 THEN 1 ELSE 0 END)) AS Count5y

INTO	#Counts
FROM	#FullSet
WHERE	PeerGroup IS NOT NULL

-------------------------------------------------------------------

SELECT	Fset.Id AS FundId
	, Fset.FundName 
	, Fset.ShortCode
	, Fset.Company 
	, Fset.PrimaryObj 
	, (CASE 
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 1 THEN 1
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 2 THEN 2
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 3 THEN 3
		WHEN (ProdRank1m/PeersNo1m)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart1m
	, (CASE 
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 1 THEN 1
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 2 THEN 2
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 3 THEN 3
		WHEN (ProdRank3m/PeersNo3m)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart3m
	, (CASE 
		WHEN (ProdRank6m/PeersNo6m)/0.25 <= 1 THEN 1
		WHEN (ProdRank6m/PeersNo6m)/0.25 <= 2 THEN 2
		WHEN (ProdRank6m/PeersNo6m)/0.25 <= 3 THEN 3
		WHEN (ProdRank6m/PeersNo6m)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart6m
	, (CASE 
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 1 THEN 1
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 2 THEN 2
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 3 THEN 3
		WHEN (ProdRank1y/PeersNo1y)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart1y
	, (CASE 
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 1 THEN 1
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 2 THEN 2
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 3 THEN 3
		WHEN (ProdRank2y/PeersNo2y)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart2y
	, (CASE 
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 1 THEN 1
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 2 THEN 2
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 3 THEN 3
		WHEN (ProdRank3y/PeersNo3y)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart3y
	, (CASE 
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 1 THEN 1
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 2 THEN 2
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 3 THEN 3
		WHEN (ProdRank5y/PeersNo5y)/0.25 <= 4 THEN 4
		ELSE 5 END) AS Quart5y

INTO	#Quartiles

FROM #FullSet AS Fset

WHERE	PeerGroup IS NOT NULL


----------------------------------------------------------------------------------

CREATE TABLE #QuartVal (Quartile NVarchar(2), QuartNo int); 
INSERT INTO #QuartVal VALUES ('1Q', 1);
INSERT INTO #QuartVal VALUES ('2Q', 2);
INSERT INTO #QuartVal VALUES ('3Q', 3);
INSERT INTO #QuartVal VALUES ('4Q', 4);
INSERT INTO #QuartVal VALUES ('NA', 5);

----------------------------------------------------------------------------------


SELECT Quartile
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1m) AS [1m]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3m) AS [3m]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart6m) AS [6m]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1y) AS [1y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart2y) AS [2y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3y) AS [3y]
	, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart5y) AS [5y]
	, 'Numbs' AS Stat

FROM #QuartVal

UNION SELECT Quartile
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1m))/
		(SELECT Count1m FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3m))/
		(SELECT Count3m FROM #Counts)
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart6m))/
		(SELECT Count6m FROM #Counts)
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

/*SELECT Quartile
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1m)) AS QC1m, 
		(SELECT Count1m FROM #Counts) AS C1m
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3m)) As QC3m,
		(SELECT Count3m FROM #Counts) AS C3m
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart6m)) AS QC6m,
		(SELECT Count6m FROM #Counts) AS C6m
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart1y)) AS QC1y,
		(SELECT Count1y FROM #Counts) AS C1y
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart2y)) AS QC2y,
		(SELECT Count2y FROM #Counts) AS C2y
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart3y)) AS QC3y,
		(SELECT Count3y FROM #Counts) AS C3y
	, CONVERT(float, (SELECT COUNT(*) FROM #Quartiles WHERE QuartNo = Quart5y)) AS QC5y,
		(SELECT Count5y FROM #Counts) AS C5y
	, 'Percs' AS Stat

FROM #QuartVal*/
----------------------------------------------------------------------------------
DROP TABLE #FullSet
DROP TABLE #Quartiles
DROP TABLE #QuartVal
DROP TABLE #Counts
GO
----------------------------------------------------------------------------------

GRANT EXECUTE ON spS_GetQuartilePerfData TO [OMAM\Compliance]

