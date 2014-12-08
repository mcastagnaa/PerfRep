USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetTCFPeerTest') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetTCFPeerTest
GO

CREATE PROCEDURE dbo.spS_GetTCFPeerTest
	@RefDate datetime

AS

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
EXEC dbo.spS_GetPerfRawData @RefDate, 1, null, null

-------------------------------------------------------------------

SELECT	Id AS FundId
	, FundName + ' vs. ' + PeerGroupLabel AS FundAndIndex
	, PrimaryObj
	, Company
	, OurTeam
	, OurPM

	, ProdRank1y
	, PeersNo1y
	, (ProdRank1y/PeersNo1y) AS Perc1y
	, (CASE	WHEN (ProdRank1y/PeersNo1y) < 0.5 THEN 1
		WHEN (ProdRank1y/PeersNo1y) <= 0.75 THEN  2
		WHEN (ProdRank1y/PeersNo1y) > 0.75 THEN 3 END) AS Test1y

	, ProdRank3y
	, PeersNo3y
	, (ProdRank3y/PeersNo3y) AS Perc3y
	, (CASE	WHEN (ProdRank3y/PeersNo3y) < 0.5 THEN 1
		WHEN (ProdRank3y/PeersNo3y) <= 0.75 THEN  2
		WHEN (ProdRank3y/PeersNo3y) > 0.75 THEN 3 END) AS Test3y

	, ProdRank5y
	, PeersNo5y
	, (ProdRank5y/PeersNo5y) AS Perc5y
	, (CASE	WHEN (ProdRank5y/PeersNo5y) < 0.5 THEN 1
		WHEN (ProdRank5y/PeersNo5y) <= 0.75 THEN  2
		WHEN (ProdRank5y/PeersNo5y) > 0.75 THEN 3 END) AS Test5y

INTO	#Interim

FROM	#FullSet
WHERE	Classification IS NOT NULL

--ORDER BY Company, OurTeam, OurPm

--SELECT * FROM #Interim

-------------------------------------------------------------------

SELECT	Id AS FundId
	, '1yTest' AS PeriodTest
	, ProdRank1y AS FundP
	, PeersNo1y AS IndexP
	, (ProdRank1y/PeersNo1y) AS Percentile
	, (CASE	WHEN (ProdRank1y/PeersNo1y) < 0.5 THEN 1
		WHEN (ProdRank1y/PeersNo1y) <= 0.75 THEN  2
		WHEN (ProdRank1y/PeersNo1y) > 0.75 THEN 3 END) AS TestRAG
INTO	#FundRAGs
FROM	#FullSet
WHERE	Classification IS NOT NULL

UNION 
SELECT	Id AS FundID
	, '3yTest' AS PeriodTest
	, ProdRank3y AS FundP
	, PeersNo3y AS IndexP
	, (ProdRank3y/PeersNo3y) AS Percentile
	, (CASE	WHEN (ProdRank3y/PeersNo3y) < 0.5 THEN 1
		WHEN (ProdRank3y/PeersNo3y) <= 0.75 THEN  2
		WHEN (ProdRank3y/PeersNo3y) > 0.75 THEN 3 END) AS TestRAG
FROM	#FullSet
WHERE	Classification IS NOT NULL

UNION 
SELECT	Id AS FundID
	, '5yTest' AS PeriodTest
	, ProdRank5y AS FundP
	, PeersNo5y As IndexP
	, (ProdRank5y/PeersNo5y) AS Perc5y
	, (CASE	WHEN (ProdRank5y/PeersNo5y) < 0.5 THEN 1
		WHEN (ProdRank5y/PeersNo5y) <= 0.75 THEN  2
		WHEN (ProdRank5y/PeersNo5y) > 0.75 THEN 3 END) AS TestRAG
FROM	#FullSet
WHERE	Classification IS NOT NULL

--SELECT * FROM #FundRAGs

----------------------------------------------------------------------------------

SELECT	MainT.FundId
	, (CASE WHEN StDev(MainT.TestRAG) IS NULL THEN SUM(MainT.TestRAG)
		WHEN StDev(MainT.TestRAG) = 0 THEN AVG(MainT.TestRAG)
		WHEN AVG(CAST(MainT.TestRAG AS Float)) = ROUND(AVG(MainT.TestRAG), 0) 
			THEN AVG(MainT.TestRAG)
		ELSE	(SELECT TOP 1 FR.TestRAG
			FROM 	#FundRAGs AS FR
			WHERE	FR.FundId = MainT.FundId
			GROUP BY FR.FundId, FR.TestRAG
			ORDER BY COUNT(TestRAG) DESC, TestRAG DESC)
		END) AS BlendRAG
	
INTO	#BlendRAG

FROM	#FundRAGs AS MainT 

GROUP BY 	MainT.FundId

--SELECT * FROM #BlendRAG

----------------------------------------------------------------------------------

INSERT INTO #FundRAGs
SELECT FundId
	, 'BlTest' AS PeriodTest
	, null AS FundP
	, null AS IndexP
	, null AS Percentile
	, BlendRAG
FROM 	#BlendRAG

--SELECT * FROM #FundRAGs

----------------------------------------------------------------------------------

SELECT	Int.*
	, Blend.BlendRAG 

INTO	#FundStats

FROM	#Interim AS Int LEFT JOIN
	#BlendRAG AS Blend ON (
		Int.FundId = Blend.FundId
		)
WHERE	Blend.BlendRAG IS NOT NULL

--SELECT * FROM #FundStats

----------------------------------------------------------------------------------

SELECT	(SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '1yTest') AS CountTest1y
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '1yTest') * 2.25, 0) AS CountTest1yHi
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '1yTest') * 1.75, 0) AS CountTest1yLow

	, (SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '3yTest') AS CountTest3y
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '3yTest') * 2.25, 0) AS CountTest3yHi
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '3yTest') * 1.75, 0) AS CountTest3yLow

	, (SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '5yTest') AS CountTest5y
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '5yTest') * 2.25, 0) AS CountTest5yHi
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = '5yTest') * 1.75, 0) AS CountTest5yLow

	, (SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = 'BlTest') AS CountBlendTest
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = 'BlTest') * 2.25, 0) AS CountBlendTestHi
	, ROUND((SELECT COUNT(TestRAG) FROM #FundRAGs WHERE PeriodTest = 'BlTest') * 1.75, 0) AS CountBlendTestLow


INTO	#Counts

--SELECT * FROM #Counts

----------------------------------------------------------------------------------

SELECT * 
INTO	#PvtRAGs

FROM	(SELECT	PeriodTest, TestRAG
	FROM 	#FundRAGs
	WHERE TestRAG IS NOT NULL) T
PIVOT (SUM(TestRAG) FOR PeriodTest IN ([1yTest], [3yTest], [5yTest], [BlTest])) AS PVT

--SELECT * FROM #PvtRAGs

----------------------------------------------------------------------------------

SELECT * 
INTO	#NonPerfRAGs

FROM	(SELECT	PeriodTest, TestRAG
	FROM 	#FundRAGs
	WHERE TestRAG IS NOT NULL
	AND TestRAG > 1) T
PIVOT (COUNT(TestRAG) FOR PeriodTest IN ([1yTest], [3yTest], [5yTest], [BlTest])) AS PVT

--SELECT * FROM #NonPerfRAGs

----------------------------------------------------------------------------------

DELETE FROM tbl_TCFPeer WHERE RefDate = @RefDate

----------------------------------------------------------------------------------

INSERT INTO	tbl_TCFPeer
SELECT 	@RefDate AS RefDate
	, 'FundDetails' AS Item
	, FundId
	, PrimaryObj
	, Company
	, OurTeam
	, OurPM
	, '(' +
		CONVERT(VARCHAR, ProdRank1y) + '/' + 
		CONVERT(VARCHAR, PeersNo1y) + ')' 
		AS Label1y
	, '(' +
		CONVERT(VARCHAR, ProdRank3y) + '/' + 
		CONVERT(VARCHAR, PeersNo3y) + ')' 
		AS Label3y
	, '(' +
		CONVERT(VARCHAR, ProdRank5y) + '/' + 
		CONVERT(VARCHAR, PeersNo5y) + ')' 
		AS Label5y
	, null AS LabelBlend

	, FundAndIndex

	, ProdRank1y
	, PeersNo1y
	, Perc1y
	, Test1y

	, ProdRank3y
	, PeersNo3y
	, Perc3y
	, Test3y

	, ProdRank5y
	, PeersNo5y
	, Perc5y
	, Test5y

	, BlendRAG
	
	, null AS NonPerfoming1y
	, null AS TotalFunds1y
	, null AS PercNonPerf1y
	, null AS LowBound1y
	, null AS HiBound1y
	, null AS RAGIndex1y

	, null AS NonPerfoming3y
	, null AS TotalFunds3y
	, null AS PercNonPerf3y
	, null AS LowBound3y
	, null AS HiBound3y
	, null AS RAGIndex3y

	, null AS NonPerfoming5y
	, null AS TotalFunds5y
	, null AS PercNonPerf5y
	, null AS LowBound5y
	, null AS HiBound5y
	, null AS RAGIndex5y

	, null AS NonPerfomingBlend
	, null AS TotalFundsBlend
	, null AS PercNonPerfBlend
	, null AS LowBoundBlend
	, null AS HiBoundBlend
	, null AS RAGIndexBlend

FROM 	#FundStats
	
UNION
SELECT 	@RefDate AS RefDate
	, 'RAG' AS ITEM
	, 0 AS FundID
	, null AS PrimaryObj
	, null As Company
	, null AS OurDesk
	, null AS OurPM
	, CONVERT(VARCHAR, RAG.[1yTest]) + ' [' +
		CONVERT(VARCHAR, C.CountTest1yLow) + ', ' + 
		CONVERT(VARCHAR, C.CountTest1yHi) + '] - ' + 
		CONVERT(VARCHAR, ROUND(CAST(NonP.[1yTest] AS float)/C.CountTest1y * 100, 2)) + 
		'% A or R out of ' +
		CONVERT(VARCHAR, C.CountTest1y) AS Label1y

	, CONVERT(VARCHAR, RAG.[3yTest]) + ' [' +
		CONVERT(VARCHAR, C.CountTest3yLow) + ', ' + 
		CONVERT(VARCHAR, C.CountTest3yHi) + '] - ' + 
		CONVERT(VARCHAR, ROUND(CAST(NonP.[3yTest] AS float)/C.CountTest3y * 100, 2)) + 
		'% A or R out of ' +
		CONVERT(VARCHAR, C.CountTest3y) AS Label3y

	, CONVERT(VARCHAR, RAG.[5yTest]) + ' [' +
		CONVERT(VARCHAR, C.CountTest5yLow) + ', ' + 
		CONVERT(VARCHAR, C.CountTest5yHi) + '] - ' + 
		CONVERT(VARCHAR, ROUND(CAST(NonP.[5yTest] AS float)/C.CountTest5y * 100, 2)) + 
		'% A or R out of ' +
		CONVERT(VARCHAR, C.CountTest5y) AS Label5y

	, CONVERT(VARCHAR, RAG.[BlTest]) + ' [' +
		CONVERT(VARCHAR, C.CountBlendTestLow) + ', ' + 
		CONVERT(VARCHAR, C.CountBlendTestHi) + '] - ' + 
		CONVERT(VARCHAR, ROUND(CAST(NonP.[BlTest] AS float)/C.CountBlendTest * 100, 2)) + 
		'% A or R out of ' +
		CONVERT(VARCHAR, C.CountBlendTest) AS LabelBlend

--	, RAG.BlendTest
	, null AS FundAndIndex
	, null AS Fund1y
	, null AS Index1y
	, null AS Perc1y
	, (CASE WHEN RAG.[1yTest] < C.CountTest1yLow THEN 1
		WHEN RAG.[1yTest] > C.CountTest1yHi THEN 3
		ELSE 2 END) AS Test1y

	, null AS Fund3y
	, null AS Index3y
	, null AS Perc3y
	, (CASE WHEN RAG.[3yTest] < C.CountTest3yLow THEN 1
		WHEN RAG.[3yTest] > C.CountTest3yHi THEN 3
		ELSE 2 END) AS Test3y

	, null AS Fund5y
	, null AS Index5y
	, null AS Perc5y
	, (CASE WHEN RAG.[5yTest] < C.CountTest5yLow THEN 1
		WHEN RAG.[5yTest] > C.CountTest5yHi THEN 3
		ELSE 2 END) AS Test5y

	, (CASE WHEN RAG.BlTest < C.CountBlendTestLow THEN 1
		WHEN RAG.BlTest > C.CountBlendTestHi THEN 3
		ELSE 2 END) AS BlendTest
	
	, NonP.[1yTest] AS NonPerfoming1y
	, C.CountTest1y AS TotalFunds1y
	, CAST(NonP.[1yTest] AS float)/C.CountTest1y AS PercNonPerf1y
	, CAST(C.CountTest1yLow AS int) AS LowBound1y
	, CAST(C.CountTest1yHi AS int) AS HiBound1y
	, RAG.[1yTest] AS RAGIndex1y

	, NonP.[3yTest] AS NonPerfoming3y
	, C.CountTest1y AS TotalFunds3y
	, CAST(NonP.[3yTest] AS float)/C.CountTest3y AS PercNonPerf3y
	, CAST(C.CountTest3yLow AS INT) AS LowBound3y
	, CAST(C.CountTest3yHi AS INT) AS HiBound3y
	, RAG.[3yTest] AS RAGIndex3y

	, NonP.[5yTest] AS NonPerfoming5y
	, C.CountTest5y AS TotalFunds5y
	, CAST(NonP.[5yTest] AS float)/C.CountTest5y AS PercNonPerf5y
	, CAST(C.CountTest5yLow AS INT) AS LowBound5y
	, CAST(C.CountTest5yHi AS INT) AS HiBound5y
	, RAG.[5yTest] AS RAGIndex5y

	, NonP.[BlTest] AS NonPerfomingBlend
	, C.CountBlendTest AS TotalFundsBlend
	, CAST(NonP.[BlTest] AS float)/C.CountBlendTest AS PercNonPerfBlend
	, CAST(C.CountBlendTestLow AS INT) AS LowBoundBlend
	, CAST(C.CountBlendTestHi AS INT) AS HiBoundBlend
	, RAG.[BlTest] AS RAGIndexBlend

FROM 	#NonPerfRAGs AS NonP
	, #Counts AS C
	, #PvtRAGs AS RAG

--ORDER BY Company, OurTeam, OurPM

----------------------------------------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #Interim
DROP TABLE #FundRAGs
DROP TABLE #BlendRAG
DROP TABLE #FundStats
DROP TABLE #Counts
DROP TABLE #PvtRAGs
DROP TABLE #NonPerfRAGs

GO
----------------------------------------------------------------------------------

GRANT EXECUTE ON spS_GetTCFPeerTest TO [OMAM\Compliance]

