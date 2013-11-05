USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_AllDYFields]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_AllDYFields]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_AllDYFields]
AS 

SELECT	P.Id AS FundId
		, P.BenchmarkId AS BenchId
		, P.BaseCCYiso AS CCY
		, D.RefDate
		, D.BizDate
		, (SELECT BenchPerf FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-1]
		, (SELECT BenchPerf FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-2]
		, (SELECT BenchPerf FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-3]
		, (SELECT BenchPerf FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-4]
		, (SELECT BenchPerf FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-5 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-5]

		, (SELECT BenchSD FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-1]
		, (SELECT BenchSD FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-2]
		, (SELECT BenchSD FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-3]
		, (SELECT BenchSD FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-4]
		, (SELECT BenchSD FROM tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-5 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-5]
		
		, (SELECT PeersNo FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-1]
		, (SELECT PeersNo FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-2]
		, (SELECT PeersNo FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-3]
		, (SELECT PeersNo FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-4]
		, (SELECT PeersNo FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-5]

		, (SELECT PeersAvg FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-1]
		, (SELECT PeersAvg FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-2]
		, (SELECT PeersAvg FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-3]
		, (SELECT PeersAvg FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-4]
		, (SELECT PeersAvg FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-5]

		, (SELECT PeersMed FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-1]
		, (SELECT PeersMed FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-2]
		, (SELECT PeersMed FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-3]
		, (SELECT PeersMed FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-4]
		, (SELECT PeersMed FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-5]

		, (SELECT Peers1stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-1]
		, (SELECT Peers1StQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-2]
		, (SELECT Peers1StQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-3]
		, (SELECT Peers1StQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-4]
		, (SELECT Peers1StQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-5]

		, (SELECT Peers3stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-1]
		, (SELECT Peers3stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-2]
		, (SELECT Peers3stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-3]
		, (SELECT Peers3stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-4]
		, (SELECT Peers3stQ_r FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-5]

		, (SELECT PeersMedSD FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-1]
		, (SELECT PeersMedSD FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-2]
		, (SELECT PeersMedSD FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-3]
		, (SELECT PeersMedSD FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-4]
		, (SELECT PeersMedSD FROM tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-5]

		, (SELECT FundNP FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [NPy-1]
		, (SELECT FundNP FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [NPy-2]
		, (SELECT FundNP FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [NPy-3]
		, (SELECT FundNP FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [NPy-4]
		, (SELECT FundNP FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [NPy-5]


		, (SELECT FundRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdRanky-1]
		, (SELECT FundRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdRanky-2]
		, (SELECT FundRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdRanky-3]
		, (SELECT FundRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdRanky-4]
		, (SELECT FundRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdRanky-5]

		, (SELECT FundBeta FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdBetay-1]
		, (SELECT FundBeta FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdBetay-2]
		, (SELECT FundBeta FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdBetay-3]
		, (SELECT FundBeta FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdBetay-4]
		, (SELECT FundBeta FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdBetay-5]

		, (SELECT FundAlpha FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdAlphay-1]
		, (SELECT FundAlpha FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdAlphay-2]
		, (SELECT FundAlpha FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdAlphay-3]
		, (SELECT FundAlpha FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdAlphay-4]
		, (SELECT FundAlpha FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdAlphay-5]

		, (SELECT FundTE FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdTEy-1]
		, (SELECT FundTE FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdTEy-2]
		, (SELECT FundTE FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdTEy-3]
		, (SELECT FundTE FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdTEy-4]
		, (SELECT FundTE FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdTEy-5]

		, (SELECT FundSD FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdStDy-1]
		, (SELECT FundSD FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdStDy-2]
		, (SELECT FundSD FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdStDy-3]
		, (SELECT FundSD FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdStDy-4]
		, (SELECT FundSD FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdStDy-5]
---ProdIR
		, (SELECT ProdIR FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdIRy-1]
		, (SELECT ProdIR FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdIRy-2]
		, (SELECT ProdIR FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdIRy-3]
		, (SELECT ProdIR FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdIRy-4]
		, (SELECT ProdIR FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdIRy-5]
---ProdIRRank
		, (SELECT ProdIRRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdIRRanky-1]
		, (SELECT ProdIRRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdIRRanky-2]
		, (SELECT ProdIRRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdIRRanky-3]
		, (SELECT ProdIRRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdIRRanky-4]
		, (SELECT ProdIRRank FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdIRRanky-5]
--PGIRNum
		, (SELECT PGIRNum FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [PGIRNumy-1]
		, (SELECT PGIRNum FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [PGIRNumy-2]
		, (SELECT PGIRNum FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [PGIRNumy-3]
		, (SELECT PGIRNum FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [PGIRNumy-4]
		, (SELECT PGIRNum FROM tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [PGIRNumy-5]		

FROM	tbl_FundsPerfs AS D LEFT JOIN
		tbl_Products AS P ON (
			P.Id = D.FundId
			) LEFT JOIN
		vw_AllPeersDefs AS Pe ON (
			P.Id = Pe.FundId
			) LEFT JOIN
		tbl_FundsAnlys AS PA ON (
			D.RefDate = PA.RefDate
			AND D.FundId = PA.FundId
			)