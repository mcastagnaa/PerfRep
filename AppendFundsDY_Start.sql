USE PerfRep
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'

TRUNCATE TABLE tbl_FundsPerfsDY

INSERT INTO tbl_FundsPerfsDY (FundId, Year, FundNP, FundRank, FundBeta, 
		FundAlpha, FundTE, FundSD, ProdIR, ProdIRRank, PGIRNum)
	(
	SELECT 	Perf.FundId
		, 2011
		, Perf.[NPy-1]
		, Perf.[ProdRanky-1]
		, Anlys.[ProdBetay-1]
		, Anlys.[ProdAlphay-1]
		, Anlys.[ProdTEy-1]
		, Anlys.[ProdStDy-1]
		, IR.[ProdIRy-1]
		, IR.[ProdIRRanky-1]
		, IR.[PGIRNumy-1]
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
			tbl_FundsAnlys AS Anlys ON (
				Perf.FundId = Anlys.FundId
				AND Perf.RefDate = Anlys.RefDate
				) LEFT JOIN
			tbl_IRPeerRanking AS IR ON (
				Perf.FundId = IR.FundId
				AND Perf.RefDate = IR.RefDate
				)
	WHERE	Perf.RefDate = @RefDate

	UNION 
	SELECT 	Perf.FundId
		, 2010
		, Perf.[NPy-2]
		, Perf.[ProdRanky-2]
		, Anlys.[ProdBetay-2]
		, Anlys.[ProdAlphay-2]
		, Anlys.[ProdTEy-2]
		, Anlys.[ProdStDy-2]
		, IR.[ProdIRy-2]
		, IR.[ProdIRRanky-2]
		, IR.[PGIRNumy-2]
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
		tbl_FundsAnlys AS Anlys ON (
			Perf.FundId = Anlys.FundId
			AND Perf.RefDate = Anlys.RefDate
			) LEFT JOIN
			tbl_IRPeerRanking AS IR ON (
				Perf.FundId = IR.FundId
				AND Perf.RefDate = IR.RefDate
				)
	WHERE	Perf.RefDate  = @RefDate

	UNION
	SELECT 	Perf.FundId
		, 2009
		, Perf.[NPy-3]
		, Perf.[ProdRanky-3]
		, Anlys.[ProdBetay-3]
		, Anlys.[ProdAlphay-3]
		, Anlys.[ProdTEy-3]
		, Anlys.[ProdStDy-3]
		, IR.[ProdIRy-3]
		, IR.[ProdIRRanky-3]
		, IR.[PGIRNumy-3]
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
		tbl_FundsAnlys AS Anlys ON (
			Perf.FundId = Anlys.FundId
			AND Perf.RefDate = Anlys.RefDate
			) LEFT JOIN
			tbl_IRPeerRanking AS IR ON (
				Perf.FundId = IR.FundId
				AND Perf.RefDate = IR.RefDate
				)
	WHERE	Perf.RefDate  = @RefDate

	UNION
	SELECT 	Perf.FundId
		, 2008
		, Perf.[NPy-4]
		, Perf.[ProdRanky-4]
		, Anlys.[ProdBetay-4]
		, Anlys.[ProdAlphay-4]
		, Anlys.[ProdTEy-4]
		, Anlys.[ProdStDy-4]
		, IR.[ProdIRy-4]
		, IR.[ProdIRRanky-4]
		, IR.[PGIRNumy-4]
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
		tbl_FundsAnlys AS Anlys ON (
			Perf.FundId = Anlys.FundId
			AND Perf.RefDate = Anlys.RefDate
			) LEFT JOIN
			tbl_IRPeerRanking AS IR ON (
				Perf.FundId = IR.FundId
				AND Perf.RefDate = IR.RefDate
				)
	WHERE	Perf.RefDate  = @RefDate

	UNION
	SELECT 	Perf.FundId
		, 2007
		, Perf.[NPy-5]
		, Perf.[ProdRanky-5]
		, Anlys.[ProdBetay-5]
		, Anlys.[ProdAlphay-5]
		, Anlys.[ProdTEy-5]
		, Anlys.[ProdStDy-5]
		, IR.[ProdIRy-5]
		, IR.[ProdIRRanky-5]
		, IR.[PGIRNumy-5]
	FROM	tbl_FundsPerfs AS Perf LEFT JOIN
		tbl_FundsAnlys AS Anlys ON (
			Perf.FundId = Anlys.FundId
			AND Perf.RefDate = Anlys.RefDate
			) LEFT JOIN
			tbl_IRPeerRanking AS IR ON (
				Perf.FundId = IR.FundId
				AND Perf.RefDate = IR.RefDate
				)
	WHERE	Perf.RefDate  = @RefDate

	)

UPDATE tbl_FundsPerfsDY
SET RefDate = CAST(CAST(Year AS NVARCHAR(4)) + '/12/31' AS datetime) 