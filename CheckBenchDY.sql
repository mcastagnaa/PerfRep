USE PerfRep
GO

SELECT 	Funds.Id AS FundId
	, Funds.Company
	, Funds.FundName + (CASE WHEN Funds.RefShClass IS NULL THEN ''
			ELSE ' - ' + Funds.RefShClass END) AS FundNameClass
	, Bench.LongName
	, BenchDY.*

FROM	tbl_products AS Funds LEFT JOIN 
	tbl_Benchmarks AS Bench ON (
		Funds.BenchmarkId = Bench.Id
		) LEFT JOIN
	tbl_BenchPerfsDY AS BenchDY ON (
		BenchDY.BenchId = Bench.Id
		AND Funds.BaseCCYIso = BenchDY.CCY
		)
WHERE	Funds.BenchmarkId IS NOT NULL
	AND Funds.InceptionDate < CAST(CAST(Year-1 AS NVARCHAR(4)) + 'Dec 31' AS datetime)
	AND (BenchDY.BenchPerf IS NULL OR BenchDY.BenchSD IS NULL)
	