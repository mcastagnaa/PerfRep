USE PerfRep
GO

SELECT	P.Id AS FundId
		, P.BenchmarkId AS BenchId
		, P.BaseCCYiso AS CCY
		, D.RefDate
		, D.BizDate
		, (SELECT BenchPerf FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-1]
		, (SELECT BenchPerf FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-2]
		, (SELECT BenchPerf FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-3]
		, (SELECT BenchPerf FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-4]
		, (SELECT BenchPerf FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-5 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [Beny-5]

		, (SELECT BenchSD FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-1]
		, (SELECT BenchSD FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-2]
		, (SELECT BenchSD FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-3]
		, (SELECT BenchSD FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-4]
		, (SELECT BenchSD FROM [OMAM\Matteoc].tbl_BenchPerfsDY
			WHERE Year = Year(D.RefDate)-5 
				AND BenchId = P.BenchmarkId
				AND CCY = P.BaseCCYiso) AS [BenStDy-5]
		
		, (SELECT PeersNo FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-1]
		, (SELECT PeersNo FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-2]
		, (SELECT PeersNo FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-3]
		, (SELECT PeersNo FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-4]
		, (SELECT PeersNo FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PeersNoy-5]

		, (SELECT PeersAvg FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-1]
		, (SELECT PeersAvg FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-2]
		, (SELECT PeersAvg FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-3]
		, (SELECT PeersAvg FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-4]
		, (SELECT PeersAvg FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGavg_ry-5]

		, (SELECT PeersMed FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-1]
		, (SELECT PeersMed FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-2]
		, (SELECT PeersMed FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-3]
		, (SELECT PeersMed FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-4]
		, (SELECT PeersMed FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGmed_ry-5]

		, (SELECT Peers1stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-1]
		, (SELECT Peers1StQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-2]
		, (SELECT Peers1StQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-3]
		, (SELECT Peers1StQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-4]
		, (SELECT Peers1StQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG1stQ_ry-5]

		, (SELECT Peers3stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-1]
		, (SELECT Peers3stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-2]
		, (SELECT Peers3stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-3]
		, (SELECT Peers3stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-4]
		, (SELECT Peers3stQ_r FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PG3stQ_ry-5]

		, (SELECT PeersMedSD FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-1]
		, (SELECT PeersMedSD FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-2]
		, (SELECT PeersMedSD FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-3]
		, (SELECT PeersMedSD FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-4]
		, (SELECT PeersMedSD FROM [OMAM\Matteoc].tbl_PeersPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND Classification = Pe.Classification
				AND Sector = Pe.Sector
				AND CCY = P.BaseCCYiso) AS [PGMedStDy-5]

		, (SELECT FundNP FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [NPy-1]
		, (SELECT FundNP FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [NPy-2]
		, (SELECT FundNP FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [NPy-3]
		, (SELECT FundNP FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [NPy-4]
		, (SELECT FundNP FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [NPy-5]


		, (SELECT FundRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdRanky-1]
		, (SELECT FundRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdRanky-2]
		, (SELECT FundRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdRanky-3]
		, (SELECT FundRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdRanky-4]
		, (SELECT FundRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdRanky-5]

		, (SELECT FundBeta FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdBetay-1]
		, (SELECT FundBeta FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdBetay-2]
		, (SELECT FundBeta FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdBetay-3]
		, (SELECT FundBeta FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdBetay-4]
		, (SELECT FundBeta FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdBetay-5]

		, (SELECT FundAlpha FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdAlphay-1]
		, (SELECT FundAlpha FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdAlphay-2]
		, (SELECT FundAlpha FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdAlphay-3]
		, (SELECT FundAlpha FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdAlphay-4]
		, (SELECT FundAlpha FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdAlphay-5]

		, (SELECT FundTE FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdTEy-1]
		, (SELECT FundTE FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdTEy-2]
		, (SELECT FundTE FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdTEy-3]
		, (SELECT FundTE FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdTEy-4]
		, (SELECT FundTE FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdTEy-5]

		, (SELECT FundSD FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdStDy-1]
		, (SELECT FundSD FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdStDy-2]
		, (SELECT FundSD FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdStDy-3]
		, (SELECT FundSD FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdStDy-4]
		, (SELECT FundSD FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdStDy-5]
---ProdIR
		, (SELECT ProdIR FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdIRy-1]
		, (SELECT ProdIR FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdIRy-2]
		, (SELECT ProdIR FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdIRy-3]
		, (SELECT ProdIR FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdIRy-4]
		, (SELECT ProdIR FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdIRy-5]
---ProdIRRank
		, (SELECT ProdIRRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [ProdIRRanky-1]
		, (SELECT ProdIRRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [ProdIRRanky-2]
		, (SELECT ProdIRRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [ProdIRRanky-3]
		, (SELECT ProdIRRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [ProdIRRanky-4]
		, (SELECT ProdIRRank FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [ProdIRRanky-5]
--PGIRNum
		, (SELECT PGIRNum FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-1 
				AND FundId = P.Id) AS [PGIRNumy-1]
		, (SELECT PGIRNum FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-2 
				AND FundId = P.Id) AS [PGIRNumy-2]
		, (SELECT PGIRNum FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-3 
				AND FundId = P.Id) AS [PGIRNumy-3]
		, (SELECT PGIRNum FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-4 
				AND FundId = P.Id) AS [PGIRNumy-4]
		, (SELECT PGIRNum FROM [OMAM\Matteoc].tbl_FundsPerfsDY
			WHERE Year = Year(D.RefDate)-5
				AND FundId = P.Id) AS [PGIRNumy-5]		

INTO	#NewDY
FROM	[OMAM\Matteoc].tbl_FundsPerfs AS D LEFT JOIN
		tbl_Products AS P ON (
			P.Id = D.FundId
			) LEFT JOIN
		[OMAM\Matteoc].vw_AllPeersDefs AS Pe ON (
			P.Id = Pe.FundId
			) LEFT JOIN
		[OMAM\Matteoc].tbl_FundsAnlys AS PA ON (
			D.RefDate = PA.RefDate
			AND D.FundId = PA.FundId
			)
		

SELECT	OFu.FundId
		, P.FundName
		, OFu.RefDate
--		, OFu.BizDate
--		, OP.[PeersNoy-1] AS [OPeersy-1]
--		, N.[PeersNoy-1] AS [NPeersy-1]
		, ISNULL(OB.[Beny-1],0) - ISNULL(N.[Beny-1],0) AS [BO-N1]
		, ISNULL(OB.[Beny-2],0) - ISNULL(N.[Beny-2],0) AS [BO-N2]
		, ISNULL(OB.[Beny-3],0) - ISNULL(N.[Beny-3],0) AS [BO-N3]
		, ISNULL(OB.[Beny-4],0) - ISNULL(N.[Beny-4],0) AS [BO-N4]
		, ISNULL(OB.[Beny-5],0) - ISNULL(N.[Beny-5],0) AS [BO-N5]

		, ISNULL(OB.[BenStDy-1],0) - ISNULL(N.[BenStDy-1],0) AS [BSDO-N1]
		, ISNULL(OB.[BenStDy-2],0) - ISNULL(N.[BenStDy-2],0) AS [BSDO-N2]
		, ISNULL(OB.[BenStDy-3],0) - ISNULL(N.[BenStDy-3],0) AS [BSDO-N3]
		, ISNULL(OB.[BenStDy-4],0) - ISNULL(N.[BenStDy-4],0) AS [BSDO-N4]
		, ISNULL(OB.[BenStDy-5],0) - ISNULL(N.[BenStDy-5],0) AS [BSDO-N5]

		, ISNULL(OP.[PeersNoy-1],0) - ISNULL(N.[PeersNoy-1],0) AS [PnO-N1]
		, ISNULL(OP.[PeersNoy-2],0) - ISNULL(N.[PeersNoy-2],0) AS [PnO-N2]
		, ISNULL(OP.[PeersNoy-3],0) - ISNULL(N.[PeersNoy-3],0) AS [PnO-N3]
		, ISNULL(OP.[PeersNoy-4],0) - ISNULL(N.[PeersNoy-4],0) AS [PnO-N4]
		, ISNULL(OP.[PeersNoy-5],0) - ISNULL(N.[PeersNoy-5],0) AS [PnO-N5]

		, ISNULL(OP.[PGavg_ry-1],0) - ISNULL(N.[PGavg_ry-1],0) AS [PaO-N1]
		, ISNULL(OP.[PGavg_ry-2],0) - ISNULL(N.[PGavg_ry-2],0) AS [PaO-N2]
		, ISNULL(OP.[PGavg_ry-3],0) - ISNULL(N.[PGavg_ry-3],0) AS [PaO-N3]
		, ISNULL(OP.[PGavg_ry-4],0) - ISNULL(N.[PGavg_ry-4],0) AS [PaO-N4]
		, ISNULL(OP.[PGavg_ry-5],0) - ISNULL(N.[PGavg_ry-5],0) AS [PaO-N5]

		, ISNULL(OP.[PGmed_ry-1],0) - ISNULL(N.[PGmed_ry-1],0) AS [PmO-N1]
		, ISNULL(OP.[PGmed_ry-2],0) - ISNULL(N.[PGmed_ry-2],0) AS [PmO-N2]
		, ISNULL(OP.[PGmed_ry-3],0) - ISNULL(N.[PGmed_ry-3],0) AS [PmO-N3]
		, ISNULL(OP.[PGmed_ry-4],0) - ISNULL(N.[PGmed_ry-4],0) AS [PmO-N4]
		, ISNULL(OP.[PGmed_ry-5],0) - ISNULL(N.[PGmed_ry-5],0) AS [PmO-N5]

		, ISNULL(OP.[PG1stQ_ry-1],0) - ISNULL(N.[PG1stQ_ry-1],0) AS [P1sO-N1]
		, ISNULL(OP.[PG1stQ_ry-2],0) - ISNULL(N.[PG1stQ_ry-2],0) AS [P1sO-N2]
		, ISNULL(OP.[PG1stQ_ry-3],0) - ISNULL(N.[PG1stQ_ry-3],0) AS [P1sO-N3]
		, ISNULL(OP.[PG1stQ_ry-4],0) - ISNULL(N.[PG1stQ_ry-4],0) AS [P1sO-N4]
		, ISNULL(OP.[PG1stQ_ry-5],0) - ISNULL(N.[PG1stQ_ry-5],0) AS [P1sO-N5]

		, ISNULL(OP.[PG3stQ_ry-1],0) - ISNULL(N.[PG3stQ_ry-1],0) AS [P3dO-N1]
		, ISNULL(OP.[PG3stQ_ry-2],0) - ISNULL(N.[PG3stQ_ry-2],0) AS [P3dO-N2]
		, ISNULL(OP.[PG3stQ_ry-3],0) - ISNULL(N.[PG3stQ_ry-3],0) AS [P3dO-N3]
		, ISNULL(OP.[PG3stQ_ry-4],0) - ISNULL(N.[PG3stQ_ry-4],0) AS [P3dO-N4]
		, ISNULL(OP.[PG3stQ_ry-5],0) - ISNULL(N.[PG3stQ_ry-5],0) AS [P3dO-N5]

		, ISNULL(OFu.[NPy-1],0) - ISNULL(N.[NPy-1],0) AS [FpO-N1]
		, ISNULL(OFu.[NPy-2],0) - ISNULL(N.[NPy-2],0) AS [FpO-N2]
		, ISNULL(OFu.[NPy-3],0) - ISNULL(N.[NPy-3],0) AS [FpO-N3]
		, ISNULL(OFu.[NPy-4],0) - ISNULL(N.[NPy-4],0) AS [FpO-N4]
		, ISNULL(OFu.[NPy-5],0) - ISNULL(N.[NPy-5],0) AS [FpO-N5]

		, ISNULL(OFu.[ProdRanky-1],0) - ISNULL(N.[ProdRanky-1],0) AS [FrO-N1]
		, ISNULL(OFu.[ProdRanky-2],0) - ISNULL(N.[ProdRanky-2],0) AS [FrO-N2]
		, ISNULL(OFu.[ProdRanky-3],0) - ISNULL(N.[ProdRanky-3],0) AS [FrO-N3]
		, ISNULL(OFu.[ProdRanky-4],0) - ISNULL(N.[ProdRanky-4],0) AS [FrO-N4]
		, ISNULL(OFu.[ProdRanky-5],0) - ISNULL(N.[ProdRanky-5],0) AS [FrO-N5]

		, ISNULL(OFa.[ProdBetay-1],0) - ISNULL(N.[ProdBetay-1],0) AS [FbO-N1]
		, ISNULL(OFa.[ProdBetay-2],0) - ISNULL(N.[ProdBetay-2],0) AS [FbO-N2]
		, ISNULL(OFa.[ProdBetay-3],0) - ISNULL(N.[ProdBetay-3],0) AS [FbO-N3]
		, ISNULL(OFa.[ProdBetay-4],0) - ISNULL(N.[ProdBetay-4],0) AS [FbO-N4]
		, ISNULL(OFa.[ProdBetay-5],0) - ISNULL(N.[ProdBetay-5],0) AS [FrO-N5]

		, ISNULL(OFa.[ProdAlphay-1],0) - ISNULL(N.[ProdAlphay-1],0) AS [FaO-N1]
		, ISNULL(OFa.[ProdAlphay-2],0) - ISNULL(N.[ProdAlphay-2],0) AS [FaO-N2]
		, ISNULL(OFa.[ProdAlphay-3],0) - ISNULL(N.[ProdAlphay-3],0) AS [FaO-N3]
		, ISNULL(OFa.[ProdAlphay-4],0) - ISNULL(N.[ProdAlphay-4],0) AS [FaO-N4]
		, ISNULL(OFa.[ProdAlphay-5],0) - ISNULL(N.[ProdAlphay-5],0) AS [FaO-N5]

		, ISNULL(OFa.[ProdTEy-1],0) - ISNULL(N.[ProdTEy-1],0) AS [FtO-N1]
		, ISNULL(OFa.[ProdTEy-2],0) - ISNULL(N.[ProdTEy-2],0) AS [FtO-N2]
		, ISNULL(OFa.[ProdTEy-3],0) - ISNULL(N.[ProdTEy-3],0) AS [FtO-N3]
		, ISNULL(OFa.[ProdTEy-4],0) - ISNULL(N.[ProdTEy-4],0) AS [FtO-N4]
		, ISNULL(OFa.[ProdTEy-5],0) - ISNULL(N.[ProdTEy-5],0) AS [FtO-N5]
		
		, ISNULL(OFa.[ProdStDy-1],0) - ISNULL(N.[ProdStDy-1],0) AS [FsO-N1]
		, ISNULL(OFa.[ProdStDy-2],0) - ISNULL(N.[ProdStDy-2],0) AS [FsO-N2]
		, ISNULL(OFa.[ProdStDy-3],0) - ISNULL(N.[ProdStDy-3],0) AS [FsO-N3]
		, ISNULL(OFa.[ProdStDy-4],0) - ISNULL(N.[ProdStDy-4],0) AS [FsO-N4]
		, ISNULL(OFa.[ProdStDy-5],0) - ISNULL(N.[ProdStDy-5],0) AS [FsO-N5]

		, ISNULL(PSI.[PGMedStDy-1],0) - ISNULL(N.[PGMedStDy-1],0) AS [PmsO-N1]
		, ISNULL(PSI.[PGMedStDy-2],0) - ISNULL(N.[PGMedStDy-2],0) AS [PmsO-N2]
		, ISNULL(PSI.[PGMedStDy-3],0) - ISNULL(N.[PGMedStDy-3],0) AS [PmsO-N3]
		, ISNULL(PSI.[PGMedStDy-4],0) - ISNULL(N.[PGMedStDy-4],0) AS [PmsO-N4]
		, ISNULL(PSI.[PGMedStDy-5],0) - ISNULL(N.[PGMedStDy-5],0) AS [PmsO-N5]
	
		, ISNULL(IR.[ProdIRy-1],0) - ISNULL(N.[ProdIRy-1],0) AS [IRO-N1]
		, ISNULL(IR.[ProdIRy-2],0) - ISNULL(N.[ProdIRy-2],0) AS [IRO-N2]
		, ISNULL(IR.[ProdIRy-3],0) - ISNULL(N.[ProdIRy-3],0) AS [IRO-N3]
		, ISNULL(IR.[ProdIRy-4],0) - ISNULL(N.[ProdIRy-4],0) AS [IRO-N4]
		, ISNULL(IR.[ProdIRy-5],0) - ISNULL(N.[ProdIRy-5],0) AS [IRO-N5]

		, ISNULL(IR.[ProdIRRanky-1],0) - ISNULL(N.[ProdIRRanky-1],0) AS [IRrO-N1]
		, ISNULL(IR.[ProdIRRanky-2],0) - ISNULL(N.[ProdIRRanky-2],0) AS [IRrO-N2]
		, ISNULL(IR.[ProdIRRanky-3],0) - ISNULL(N.[ProdIRRanky-3],0) AS [IRrO-N3]
		, ISNULL(IR.[ProdIRRanky-4],0) - ISNULL(N.[ProdIRRanky-4],0) AS [IRrO-N4]
		, ISNULL(IR.[ProdIRRanky-5],0) - ISNULL(N.[ProdIRRanky-5],0) AS [IRrO-N5]

		, ISNULL(IR.[PGIRNumy-1],0) - ISNULL(N.[PGIRNumy-1],0) AS [IRnO-N1]
		, ISNULL(IR.[PGIRNumy-2],0) - ISNULL(N.[PGIRNumy-2],0) AS [IRnO-N2]
		, ISNULL(IR.[PGIRNumy-3],0) - ISNULL(N.[PGIRNumy-3],0) AS [IRnO-N3]
		, ISNULL(IR.[PGIRNumy-4],0) - ISNULL(N.[PGIRNumy-4],0) AS [IRnO-N4]
		, ISNULL(IR.[PGIRNumy-5],0) - ISNULL(N.[PGIRNumy-5],0) AS [IRnO-N5]


FROM	[OMAM\Matteoc].tbl_FundsPerfs AS OFu LEFT JOIN
		tbl_Products AS P ON (
			OFu.FundId = P.Id
		) LEFT JOIN 
		[OMAM\Matteoc].tbl_BenchPerfs AS OB ON (
			OFu.RefDate = OB.RefDate
			AND OB.CCY = P.BaseCCYiso
			AND OB.BchkId = P.BenchmarkId
		) LEFT JOIN 
		#NewDY AS N ON (
			OFu.RefDate = N.RefDate
			AND OFu.FundId = N.FundId
		) LEFT JOIN
		vw_AllPeersDefs AS PeD ON (
			PeD.FundId = P.Id
		) LEFT JOIN
		tbl_PeersPerfs AS OP  ON (
			OFu.RefDate = OP.RefDate
			AND OP.Classification = PeD.Classification
			AND OP.Sector = PeD.Sector
			AND OP.CCY = PeD.CCY
		) LEFT JOIN
		[OMAM\Matteoc].tbl_FundsAnlys AS OFa ON (
			OFa.FundId = P.Id
			AND OFa.RefDate = OFu.RefDate
		) LEFT JOIN
		[OMAM\Matteoc].tbl_PeersPerfsSI AS PSI ON (
			PSI.Classification = OP.Classification
			AND PSI.Sector = OP.Sector
			AND PSI.CCY = OP.CCY
			AND PSI.InceptionDate = P.InceptionDate
			AND OFu.RefDate = PSI.RefDate
		) LEFT JOIN
		[OMAM\Matteoc].tbl_IRPeerRanking AS IR ON (
			IR.FundId = P.Id
			AND IR.RefDate = OFu.RefDate
		)
		

WHERE OFu.RefDate = '2012 Dec 31'


DROP TABLE #NewDY
