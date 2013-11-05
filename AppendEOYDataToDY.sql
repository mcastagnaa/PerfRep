USE PerfRep
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'

DELETE
FROM tbl_BenchPerfsDY
WHERE year = Year(@RefDate)

INSERT INTO tbl_BenchPerfsDY (
			BenchId
			, CCY
			, Year
			, BenchPerf
			, BenchSD)
	(
	SELECT 	BchkId
		, CCY
		, Year(@RefDate)
		, [Ben1y]
		, [BenStD1y]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate
	)

UPDATE tbl_BenchPerfsDY
SET RefDate = @RefDate
WHERE Year = Year(@RefDate)

--------------------------------------------

DELETE
FROM tbl_FundsPerfsDY
WHERE year = Year(@RefDate)

INSERT INTO tbl_FundsPerfsDY (
		FundId
		, Year
		, FundNP
		, FundRank
		, FundBeta
		, FundAlpha
		, FundTE
		, FundSD
		, ProdIR
		, ProdIRRank
		, PGIRNum)
	(

	SELECT 	Perf.FundId
		, Year(@RefDate)
		, Perf.[NP1y]
		, Perf.[ProdRank1y]
		, Anlys.[ProdBeta1y]
		, Anlys.[ProdAlpha1y]
		, Anlys.[ProdTE1y]
		, Anlys.[ProdStD1y]
		, IR.ProdIR1y
		, IR.ProdIRRank1y
		, IR.PGIRNum1y
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
			tbl_FundsAnlys AS Anlys ON (
				Perf.FundId = Anlys.FundId
				AND Perf.RefDate = Anlys.RefDate
				) LEFT JOIN 
			tbl_IRPeerRanking AS IR ON (
				IR.FundId = Perf.FundId
				AND IR.RefDate = Perf.RefDate
				)
	WHERE	Perf.RefDate = @RefDate
	)

UPDATE tbl_FundsPerfsDY
SET RefDate = @RefDate
WHERE Year = Year(@RefDate)

------------------------------------------------

DELETE
FROM tbl_PeersPerfsDY
WHERE year = Year(@RefDate)

INSERT INTO tbl_PeersPerfsDY (
		Classification
		, Sector
		, CCY
		, Year
		, PeersNo
		, Peers1stQ_r
		, Peers3stQ_r
		, PeersAvg
		, PeersMed
		, PeersMedSD)

	(
	SELECT 	DISTINCT P.Classification
		, P.Sector
		, P.CCY
		, Year(@RefDate)
		, P.[PeersNo1y]
		, P.[PG1stQ_r1y]
		, P.[PG3stQ_r1y]
		, P.[PGAvg_r1y]
		, P.[PGMed_r1y]
		, PSI.[PGMedStD1y]

	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS PSI ON (
				P.Classification = PSI.Classification
				AND P.Sector = PSI.Sector
				AND P.CCY = PSI.CCY
				AND P.RefDate = PSI.RefDate
			)
	WHERE	P.RefDate = @RefDate
	)

UPDATE tbl_PeersPerfsDY
SET RefDate = @RefDate
WHERE Year = Year(@RefDate)