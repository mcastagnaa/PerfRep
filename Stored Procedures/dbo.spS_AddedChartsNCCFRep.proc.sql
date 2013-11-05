USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_AddedChartsNCCFRep') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_AddedChartsNCCFRep
GO

CREATE PROCEDURE dbo.spS_AddedChartsNCCFRep
		@refDate datetime
		, @fundId integer

AS

SET NOCOUNT ON;

--------------------------------------------------------

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
		, Bench.BenStD1y/100 AS BenStD1y
		, Bench.BenStD3y/100 AS BenStD3y

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
			) LEFT JOIN
		tbl_benchPerfs as Bench ON (
			Funds.BenchmarkId = Bench.BchkId
			AND Bench.RefDate = Perf.RefDate
			)
WHERE	Perc.FundId = @fundId
		AND Perf.RefDate <= @refDate

ORDER BY Perc.RefDate


--------------------------------------------------------

GO
GRANT EXECUTE ON dbo.spS_AddedChartsNCCFRep TO [OMAM\Compliance]