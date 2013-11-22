USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_CompNCCF]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_CompNCCF]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_CompNCCF]
AS 


WITH BestComp (RefDate, FundId, MaxNCCF1m, MaxNCCF3m, CompNo)
	AS
	(
	SELECT	R.RefDate
			, R.FundId
			, MAX(R.NCCF1m)
			, MAX(R.NCCF3m)
			, COUNT(FundId)
	FROM tbl_NCCFPerf AS R
	WHERE	RefDate > '2012 Dec 31'
			AND Item IN ('OMGI', 'Comp')
			AND ((NCCF1m IS NOT NULL) OR (NCCF3m IS NOT NULL))
	GROUP BY RefDate, FundId
	) ,

Best1mPerf (RefDate, FundId, Perf1y, Perf3y, StDev1y, StDev3y)
	AS
	(
	SELECT	R.RefDate
			, R.FundId
			, AVG(R.Perf1y)
			, AVG(R.Perf3y)
			, AVG(R.StDev1y)
			, AVG(R.StDev3y)
	FROM	Tbl_NCCFPerf AS R JOIN
			BestComp AS B ON (
				B.MaxNCCF1m = R.NCCF1m
				AND B.RefDate = R.RefDate
				AND B.FundId = R.FundId
				)
	WHERE	Item IN ('OMGI', 'Comp')
			AND ((NCCF1m IS NOT NULL) OR (NCCF3m IS NOT NULL))
	GROUP BY R.RefDate, R.FundId
	) ,

Best3mPerf (RefDate, FundId, Perf1y, Perf3y, StDev1y, StDev3y)
	AS
	(
	SELECT	R.RefDate
			, R.FundId
			, AVG(R.Perf1y)
			, AVG(R.Perf3y)
			, AVG(R.StDev1y)
			, AVG(R.StDev3y)
	FROM	Tbl_NCCFPerf AS R JOIN
			BestComp AS B ON (
				B.MaxNCCF3m = R.NCCF3m
				AND B.RefDate = R.RefDate
				AND B.FundId = R.FundId
				)
	WHERE	Item IN ('OMGI', 'Comp')
			AND ((NCCF1m IS NOT NULL) OR (NCCF3m IS NOT NULL))
	GROUP BY R.RefDate, R.FundId
	)

--SELECT * FROM Best1mPerf ORDER BY RefDate, FundId

SELECT	(CASE P.Item WHEN 'Comp' 
			THEN P.Item + CAST(P.CompId AS VARCHAR(1))
			ELSE P.Item END) AS ItemId
		, P.NCCF1m/B.MaxNCCF1m AS RatioToBS1m
		, P.NCCF3m/B.MaxNCCF3m AS RatioToBS3m
		, P.Perf1y/BP1m.Perf1y AS Perf1y1mRatio
		, P.Perf3y/BP1m.Perf3y AS Perf3y1mRatio
		, P.StDev1y/BP1m.StDev1y AS StDev1y1mRatio
		, P.StDev3y/BP1m.StDev3y AS StDev3y1mRatio
		, P.Perf1y/BP3m.Perf1y AS Perf1y3mRatio
		, P.Perf3y/BP3m.Perf3y AS Perf3y3mRatio
		, P.StDev1y/BP3m.StDev1y AS StDev1y3mRatio
		, P.StDev3y/BP3m.StDev3y AS StDev3y3mRatio
		, P.NCCF1m/1000000 AS NCCF1mGBPmn
		, P.NCCF3m/1000000 AS NCCF3mGBPmn
		, P.Perf1y
		, P.Perf3y
		, P.StDev1y
		, P.StDev3y
		, B.CompNo
		, P.FundId
		, P.RefDate
		, P.FundName
		, P.Sector
FROM	tbl_NCCFPerf AS P LEFT JOIN
		BestComp AS B ON (
			B.RefDate = P.RefDate
			AND B.FundId = P.FundId
		) LEFT JOIN
		Best1mPerf AS BP1m ON (
			BP1m.RefDate = P.RefDate
			AND BP1m.FundId = P.FundId
		) LEFT JOIN
		Best3mPerf AS BP3m ON (
			BP3m.RefDate = P.RefDate
			AND BP3m.FundId = P.FundId
		) 	
WHERE	((P.NCCF1m IS NOT NULL) OR (P.NCCF3m IS NOT NULL))
--		AND P.Item NOT LIKE 'BS%'

--ORDER BY P.RefDate, P.FundId
