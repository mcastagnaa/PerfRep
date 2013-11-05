Use Product;
DECLARE @refDate datetime
SET @refDate = '2013 May 29'


SELECT FundName, FundCode, [Benchmark Name] AS BenchName
INTO #FactsetBench
FROM vew_FSR_FacstetDailyRisk WHERE NaVDate = @refDate

USE PerfRep;
SELECT P.Id, P.FundName, P.ShortCode
, (CASE B.IsCash WHEN 1 THEN 'CashBenchmark' ELSE B.LongName END) AS BenchName
INTO	#PerfRefBench
FROM tbl_products AS P LEFT JOIN 
	tbl_benchmarks AS B  ON (P.benchmarkId = B.id)
WHERE	P.CloseDate IS NULL
		AND P.InceptionDate < @Refdate
		AND (
			(P.InvManager <> 'OMGI') OR 
			(P.InvManager = 'OMGI' AND P.OurTeam = 'MultiAsset')
			)

SELECT P.Id
		, P.FundName AS GoodName
		, F.FundName As FactsetName
		, P.ShortCode
		, P.BenchName AS GoodBenchmark 
		, F.BenchName AS FactsetBenchmark
FROM	#PerfRefBench AS P LEFT JOIN
		#FactsetBench AS F ON (
			P.ShortCode = F.FundCode
			)

DROP TABLE #FactsetBench
DROP TABLE #PerfRefbench