USE PerfRep;

SELECT	Perc.RefDate
		, Funds.ShortCode
		, Funds.FundName
		, Perc.Perc1m AS Percentile1m
		, Perc.Perc3m AS Percentile3m
		, Perc.BenchRP3m AS RelPerf3m
		, Perf.NP3m/100 AS AbsPerf3m
		, Perc.Perc1y AS Percentile1y
		, Perf.NP1y/100 AS AbsPerf1y
		, Perc.BenchRP1y AS RelPerf1y
		, Anly.ProdStD1y/100 AS StDev1y
		, Perc.Perc3y AS Percentile3y
		, Perf.NP3y_a/100 AS AbsPerf3y
		, Perc.BenchRP3ya AS RelPerf3y
		, Anly.ProdStD3y/100 AS StDev3y

FROM	tbl_EoMPerfSummary AS Perc LEFT JOIN
		tbl_Products AS Funds ON (
			Perc.FundId = Funds.Id
			) LEFT JOIN
		tbl_FundsPerfs AS Perf ON (
			Perf.FundId = Perc.FundId
			AND Perf.RefDate = Perc.RefDate
			) LEFT JOIN
		tbl_FundsAnlys AS Anly ON (
			Perf.FundId = Anly.FundId
			AND Perf.RefDate = Anly.RefDate
			)
WHERE	Perc.FundId = 317
ORDER BY Perc.RefDate
