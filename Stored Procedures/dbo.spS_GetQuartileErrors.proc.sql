USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetQuartileErrors') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetQuartileErrors
GO

CREATE PROCEDURE dbo.spS_GetQuartileErrors
	@RefDate datetime

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
	, ShortCode
	, Company 
	, FundName
	, PeerGroupLabel
	, (CASE WHEN CONVERT(float,ProdRank1m)/PeersNo1m > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank1m)/PeersNo1m > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank1m)/PeersNo1m > 0.25 THEN 2
		WHEN ProdRank1m IS NULL THEN NULL
		ELSE 1 END) AS Quart1m
	, (CASE	WHEN NP1m >= PG1stQ_r1m THEN 1
		WHEN NP1m >= PGmed_r1m THEN 2
		WHEN NP1m >= PG3stQ_r1m THEN 3
		WHEN NP1m IS NULL THEN NULL
		ELSE 4 END) AS Quart1mT
	, (CASE	WHEN ProdRank1m > PeersNo1m THEN 0 ELSE 1 END) AS Quart1mBasic

	, (CASE WHEN CONVERT(float,ProdRank3m)/PeersNo3m > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank3m)/PeersNo3m > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank3m)/PeersNo3m > 0.25 THEN 2
		WHEN ProdRank3m IS NULL THEN NULL
		ELSE 1 END) AS Quart3m
	, (CASE	WHEN NP3m >= PG1stQ_r3m THEN 1
		WHEN NP3m >= PGmed_r3m THEN 2
		WHEN NP3m >= PG3stQ_r3m THEN 3
		WHEN NP3m IS NULL THEN NULL
		ELSE 4 END) AS Quart3mT
	, (CASE	WHEN ProdRank3m > PeersNo3m THEN 0 ELSE 1 END) AS Quart3mBasic

	, (CASE WHEN CONVERT(float,ProdRank6m)/PeersNo6m > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank6m)/PeersNo6m > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank6m)/PeersNo6m > 0.25 THEN 2
		WHEN ProdRank6m IS NULL THEN NULL
		ELSE 1 END) AS Quart6m
	, (CASE	WHEN NP6m >= PG1stQ_r6m THEN 1
		WHEN NP6m >= PGmed_r6m THEN 2
		WHEN NP6m >= PG3stQ_r6m THEN 3
		WHEN NP6m IS NULL THEN NULL
		ELSE 4 END) AS Quart6mT
	, (CASE	WHEN ProdRank6m > PeersNo6m THEN 0 ELSE 1 END) AS Quart6mBasic

	, (CASE WHEN CONVERT(float,ProdRank1y)/PeersNo1y > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank1y)/PeersNo1y > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank1y)/PeersNo1y > 0.25 THEN 2
		WHEN ProdRank1y IS NULL THEN NULL
		ELSE 1 END) AS Quart1y
	, (CASE	WHEN NP1y >= PG1stQ_r1y THEN 1
		WHEN NP1y >= PGmed_r1y THEN 2
		WHEN NP1y >= PG3stQ_r1y THEN 3
		WHEN NP1y IS NULL THEN NULL
		ELSE 4 END) AS Quart1yT
	, (CASE	WHEN ProdRank1y > PeersNo1y THEN 0 ELSE 1 END) AS Quart1yBasic

	, (CASE WHEN CONVERT(float,ProdRank2y)/PeersNo2y > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank2y)/PeersNo2y > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank2y)/PeersNo2y > 0.25 THEN 2
		WHEN ProdRank2y IS NULL THEN NULL
		ELSE 1 END) AS Quart2y
	, (CASE	WHEN NP2y >= PG1stQ_r2y THEN 1
		WHEN NP2y >= PGmed_r2y THEN 2
		WHEN NP2y >= PG3stQ_r2y THEN 3
		WHEN NP2y IS NULL THEN NULL
		ELSE 4 END) AS Quart2yT
	, (CASE	WHEN ProdRank2y > PeersNo2y THEN 0 ELSE 1 END) AS Quart2yBasic

	, (CASE WHEN CONVERT(float,ProdRank3y)/PeersNo3y > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank3y)/PeersNo3y > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank3y)/PeersNo3y > 0.25 THEN 2
		WHEN ProdRank3y IS NULL THEN NULL
		ELSE 1 END) AS Quart3y
	, (CASE	WHEN NP3y >= PG1stQ_r3y THEN 1
		WHEN NP3y >= PGmed_r3y THEN 2
		WHEN NP3y >= PG3stQ_r3y THEN 3
		WHEN NP3y IS NULL THEN NULL
		ELSE 4 END) AS Quart3yT
	, (CASE	WHEN ProdRank3y > PeersNo3y THEN 0 ELSE 1 END) AS Quart3yBasic

	, (CASE WHEN CONVERT(float,ProdRank5y)/PeersNo5y > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank5y)/PeersNo5y > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank5y)/PeersNo5y > 0.25 THEN 2
		WHEN ProdRank5y IS NULL THEN NULL
		ELSE 1 END) AS Quart5y
	, (CASE	WHEN NP5y >= PG1stQ_r5y THEN 1
		WHEN NP5y >= PGmed_r5y THEN 2
		WHEN NP5y >= PG3stQ_r5y THEN 3
		WHEN NP5y IS NULL THEN NULL
		ELSE 4 END) AS Quart5yT
	, (CASE	WHEN ProdRank5y > PeersNo5y THEN 0 ELSE 1 END) AS Quart5yBasic

	, (CASE WHEN CONVERT(float,ProdRankYtD)/PeersNoYtD > 0.75 THEN 4
		WHEN CONVERT(float,ProdRankYtD)/PeersNoYtD > 0.5 THEN 3
		WHEN CONVERT(float,ProdRankYtD)/PeersNoYtD > 0.25 THEN 2
		WHEN ProdRankYtD IS NULL THEN NULL
		ELSE 1 END) AS QuartYtD
	, (CASE	WHEN NPYtD >= PG1stQ_rYtD THEN 1
		WHEN NPYtD >= PGmed_rYtD THEN 2
		WHEN NPYtD >= PG3stQ_rYtD THEN 3
		WHEN NPYtD IS NULL THEN NULL
		ELSE 4 END) AS QuartYtDT
	, (CASE	WHEN ProdRankYtD > PeersNoYtD THEN 0 ELSE 1 END) AS QuartYtDBasic

	, (CASE WHEN CONVERT(float,[ProdRanky-1])/[PeersNoy-1] > 0.75 THEN 4
		WHEN CONVERT(float,[ProdRanky-1])/[PeersNoy-1] > 0.5 THEN 3
		WHEN CONVERT(float,[ProdRanky-1])/[PeersNoy-1] > 0.25 THEN 2
		WHEN [ProdRanky-1] IS NULL THEN NULL
		ELSE 1 END) AS [Quarty-1]
	, (CASE	WHEN [NPy-1] >= [PG1stQ_ry-1] THEN 1
		WHEN [NPy-1] >= [PGmed_ry-1] THEN 2
		WHEN [NPy-1] >= [PG3stQ_ry-1] THEN 3
		WHEN [NPy-1] IS NULL THEN NULL
		ELSE 4 END) AS [Quarty-1T]
	, (CASE	WHEN [ProdRanky-1] > [PeersNoy-1] THEN 0 ELSE 1 END) AS [Quarty-1Basic]

	, (CASE WHEN CONVERT(float,[ProdRanky-2])/[PeersNoy-2] > 0.75 THEN 4
		WHEN CONVERT(float,[ProdRanky-2])/[PeersNoy-2] > 0.5 THEN 3
		WHEN CONVERT(float,[ProdRanky-2])/[PeersNoy-2] > 0.25 THEN 2
		WHEN [ProdRanky-2] IS NULL THEN NULL
		ELSE 1 END) AS [Quarty-2]
	, (CASE	WHEN [NPy-2] >= [PG1stQ_ry-2] THEN 1
		WHEN [NPy-2] >= [PGmed_ry-2] THEN 2
		WHEN [NPy-2] >= [PG3stQ_ry-2] THEN 3
		WHEN [NPy-2] IS NULL THEN NULL
		ELSE 4 END) AS [Quarty-2T]
	, (CASE	WHEN [ProdRanky-2] > [PeersNoy-2] THEN 0 ELSE 1 END) AS [Quarty-2Basic]

	, (CASE WHEN CONVERT(float,[ProdRanky-3])/[PeersNoy-3] > 0.75 THEN 4
		WHEN CONVERT(float,[ProdRanky-3])/[PeersNoy-3] > 0.5 THEN 3
		WHEN CONVERT(float,[ProdRanky-3])/[PeersNoy-3] > 0.25 THEN 2
		WHEN [ProdRanky-3] IS NULL THEN NULL
		ELSE 1 END) AS [Quarty-3]
	, (CASE	WHEN [NPy-3] >= [PG1stQ_ry-3] THEN 1
		WHEN [NPy-3] >= [PGmed_ry-3] THEN 2
		WHEN [NPy-3] >= [PG3stQ_ry-3] THEN 3
		WHEN [NPy-3] IS NULL THEN NULL
		ELSE 4 END) AS [Quarty-3T]
	, (CASE	WHEN [ProdRanky-3] > [PeersNoy-3] THEN 0 ELSE 1 END) AS [Quarty-3Basic]

	, (CASE WHEN CONVERT(float,[ProdRanky-4])/[PeersNoy-4] > 0.75 THEN 4
		WHEN CONVERT(float,[ProdRanky-4])/[PeersNoy-4] > 0.5 THEN 3
		WHEN CONVERT(float,[ProdRanky-4])/[PeersNoy-4] > 0.25 THEN 2
		WHEN [ProdRanky-4] IS NULL THEN NULL
		ELSE 1 END) AS [Quarty-4]
	, (CASE	WHEN [NPy-4] >= [PG1stQ_ry-4] THEN 1
		WHEN [NPy-4] >= [PGmed_ry-4] THEN 2
		WHEN [NPy-4] >= [PG3stQ_ry-4] THEN 3
		WHEN [NPy-4] IS NULL THEN NULL
		ELSE 4 END) AS [Quarty-4T]
	, (CASE	WHEN [ProdRanky-4] > [PeersNoy-4] THEN 0 ELSE 1 END) AS [Quarty-4Basic]

	, (CASE WHEN CONVERT(float,[ProdRanky-5])/[PeersNoy-5] > 0.75 THEN 4
		WHEN CONVERT(float,[ProdRanky-5])/[PeersNoy-5] > 0.5 THEN 3
		WHEN CONVERT(float,[ProdRanky-5])/[PeersNoy-5] > 0.25 THEN 2
		WHEN [ProdRanky-5] IS NULL THEN NULL
		ELSE 1 END) AS [Quarty-5]
	, (CASE	WHEN [NPy-5] >= [PG1stQ_ry-5] THEN 1
		WHEN [NPy-5] >= [PGmed_ry-5] THEN 2
		WHEN [NPy-5] >= [PG3stQ_ry-5] THEN 3
		WHEN [NPy-5] IS NULL THEN NULL
		ELSE 4 END) AS [Quarty-5T]
	, (CASE	WHEN [ProdRanky-5] > [PeersNoy-5] THEN 0 ELSE 1 END) AS [Quarty-5Basic]

	, (CASE WHEN CONVERT(float,ProdRankEo2y_TD)/PeersNoEo2y_TD > 0.75 THEN 4
		WHEN CONVERT(float,ProdRankEo2y_TD)/PeersNoEo2y_TD > 0.5 THEN 3
		WHEN CONVERT(float,ProdRankEo2y_TD)/PeersNoEo2y_TD > 0.25 THEN 2
		WHEN ProdRankEo2y_TD IS NULL THEN NULL
		ELSE 1 END) AS QuartEo2y_TD
	, (CASE	WHEN NPEo2y_TD >= PG1stQ_rEo2y_TD THEN 1
		WHEN NPEo2y_TD >= PGmed_rEo2y_TD THEN 2
		WHEN NPEo2y_TD >= PG3stQ_rEo2y_TD THEN 3
		WHEN NPEo2y_TD IS NULL THEN NULL
		ELSE 4 END) AS QuartEo2y_TDT
	, (CASE	WHEN ProdRankEo2Y_TD > PeersNoEo2y_TD THEN 0 ELSE 1 END) AS QuartEo2yBasic

	, (CASE WHEN CONVERT(float,ProdRankEo3y_TD)/PeersNoEo3y_TD > 0.75 THEN 4
		WHEN CONVERT(float,ProdRankEo3y_TD)/PeersNoEo3y_TD > 0.5 THEN 3
		WHEN CONVERT(float,ProdRankEo3y_TD)/PeersNoEo3y_TD > 0.25 THEN 2
		WHEN ProdRankEo3y_TD IS NULL THEN NULL
		ELSE 1 END) AS QuartEo3y_TD
	, (CASE	WHEN NPEo3y_TD >= PG1stQ_rEo3y_TD THEN 1
		WHEN NPEo3y_TD >= PGmed_rEo3y_TD THEN 2
		WHEN NPEo3y_TD >= PG3stQ_rEo3y_TD THEN 3
		WHEN NPEo3y_TD IS NULL THEN NULL
		ELSE 4 END) AS QuartEo3y_TDT
	, (CASE	WHEN ProdRankEo3Y_TD > PeersNoEo3y_TD THEN 0 ELSE 1 END) AS QuartEo3yBasic

	, (CASE WHEN CONVERT(float,ProdRank_SI)/PeersNo_SI > 0.75 THEN 4
		WHEN CONVERT(float,ProdRank_SI)/PeersNo_SI > 0.5 THEN 3
		WHEN CONVERT(float,ProdRank_SI)/PeersNo_SI > 0.25 THEN 2
		WHEN ProdRank_SI IS NULL THEN NULL
		ELSE 1 END) AS Quart_SI
	, (CASE	WHEN NP_SI >= PG1stQ_r_SI THEN 1
		WHEN NP_SI >= PGmed_r_SI THEN 2
		WHEN NP_SI >= PG3stQ_r_SI THEN 3
		WHEN NP_SI IS NULL THEN NULL
		ELSE 4 END) AS Quart_SIT
	, (CASE	WHEN ProdRank_SI > PeersNo_SI THEN 0 ELSE 1 END) AS QuartSIBasic


INTO	#TestElements

FROM	#FullSet
WHERE	PeerGroupLabel <> 'No peer group'

--SELECT * FROM #TestElements WHERE FundId = 290

----------------------------------------------------------------------------------

SELECT	FundId
	, ShortCode
	, Company 
	, FundName
	, PeerGroupLabel
	, (CASE WHEN ISNULL(Quart1m,1) = ISNULL(Quart1mT,1) THEN 1 ELSE 0 END) AS Test1m
	, Quart1mBasic
	, (CASE WHEN ISNULL(Quart3m,1) = ISNULL(Quart3mT,1) THEN 1 ELSE 0 END) AS Test3m
	, Quart3mBasic
	, (CASE WHEN ISNULL(Quart6m,1) = ISNULL(Quart6mT,1) THEN 1 ELSE 0 END) AS Test6m
	, Quart6mBasic
	, (CASE WHEN ISNULL(Quart1y,1) = ISNULL(Quart1yT,1) THEN 1 ELSE 0 END) AS Test1y
	, Quart1yBasic
	, (CASE WHEN ISNULL(Quart2y,1) = ISNULL(Quart2yT,1) THEN 1 ELSE 0 END) AS Test2y
	, Quart2yBasic
	, (CASE WHEN ISNULL(Quart3y,1) = ISNULL(Quart3yT,1) THEN 1 ELSE 0 END) AS Test3y
	, Quart3yBasic
	, (CASE WHEN ISNULL(Quart5y,1) = ISNULL(Quart5yT,1) THEN 1 ELSE 0 END) AS Test5y
	, Quart5yBasic
	, (CASE WHEN ISNULL([Quarty-1],1) = ISNULL([Quarty-1T],1) THEN 1 ELSE 0 END) AS [Testy-1]
	, [Quarty-1Basic]
	, (CASE WHEN ISNULL([Quarty-2],1) = ISNULL([Quarty-2T],1) THEN 1 ELSE 0 END) AS [Testy-2]
	, [Quarty-2Basic]
	, (CASE WHEN ISNULL([Quarty-3],1) = ISNULL([Quarty-3T],1) THEN 1 ELSE 0 END) AS [Testy-3]
	, [Quarty-3Basic]
	, (CASE WHEN ISNULL([Quarty-4],1) = ISNULL([Quarty-4T],1) THEN 1 ELSE 0 END) AS [Testy-4]
	, [Quarty-4Basic]
	, (CASE WHEN ISNULL([Quarty-5],1) = ISNULL([Quarty-5T],1) THEN 1 ELSE 0 END) AS [Testy-5]
	, [Quarty-5Basic]
	, (CASE WHEN ISNULL(QuartEo2y_TD,1) = ISNULL(QuartEo2y_TDT,1) THEN 1 ELSE 0 END) AS TestEo2y_TD
	, QuartEo2yBasic
	, (CASE WHEN ISNULL(QuartEo3y_TD,1) = ISNULL(QuartEo3y_TDT,1) THEN 1 ELSE 0 END) AS TestEo3y_TD
	, QuartEo3yBasic
	, (CASE WHEN ISNULL(Quart_SI,1) = ISNULL(Quart_SIT,1) THEN 1 ELSE 0 END) AS Test_SI
	, QuartSIBasic

INTO	#FinalTest
FROM 	#TestElements

----------------------------------------------------------------------------------

SELECT * FROM #FinalTest
WHERE	Test1m
	+ Quart1mBasic
	+ Test3m
	+ Quart3mBasic
	+ Test6m
	+ Quart6mBasic
	+ Test1y
	+ Quart1yBasic
	+ Test2y
	+ Quart2yBasic
	+ Test3y
	+ Quart3yBasic
	+ Test5y
	+ Quart5yBasic
	+ [Testy-1]
	+ [Quarty-1Basic]
	+ [Testy-2]
	+ [Quarty-2Basic]
	+ [Testy-3]
	+ [Quarty-3Basic]
	+ [Testy-4]
	+ [Quarty-4Basic]
	+ [Testy-5]
	+ [Quarty-5Basic]
	+ TestEo2y_TD
	+ QuartEo2yBasic
	+ TestEo3y_TD
	+ QuartEo3yBasic
	+ Test_SI
	+ QuartSIBasic
	< 30

ORDER BY Company
----------------------------------------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #TestElements
DROP TABLE #FinalTest

GO
----------------------------------------------------------------------------------

GRANT EXECUTE ON spS_GetQuartileErrors TO [OMAM\Compliance]

