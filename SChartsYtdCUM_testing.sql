USE PerfRep


DECLARE @RefDate AS datetime
DECLARE @IMs AS Int

SET @RefDate = '2012 Aug 31'


-------------------------------------------------------------

SELECT	MStarCategory
	, AVG([YtDCum]) AS MedianReturn

INTO	#SMed
FROM
	(
	SELECT	MStarCategory
		, [YtDCum]
		, ROW_NUMBER() OVER (
			PARTITION BY MStarCategory
			ORDER BY [YtDCum] ASC, FundName ASC) AS RowAsc
		, ROW_NUMBER() OVER (
			PARTITION BY MStarCategory
			ORDER BY [YtDCum] DESC, FundName DESC) AS RowDesc
	FROM tbl_SCHARTSrawdata
	WHERE [YtDCum] IS NOT NULL 
		AND Date = @RefDate
	) X
	WHERE RowAsc IN (RowDesc, RowDesc - 1, RowDesc + 1) 
	GROUP BY MstarCategory
--	ORDER BY MstarCategory

-------------------------------------------------------------

SELECT	Dset.IM
	, DSet.FundName
	, DSet.[YtDCum]
	, DSet.MStarCategory
	, SMed.MedianReturn
	, (CASE WHEN Dset.[YtDCum] >= SMed.MedianReturn THEN 1
		ELSE 0 END) AS ISAhead
	
INTO	#MedianTest

FROM	tbl_SCHARTSRawdata AS DSet LEFT JOIN
	#SMed AS SMed ON (
		DSet.MStarCategory = SMed.MStarCategory
		)

WHERE	DSet.[YtDCum] IS NOT NULL
	AND Dset.Date = @RefDate
	
-------------------------------------------------------------


SELECT Test.IM
	, SUM(Test.ISAhead) AS NumberAhead
	, COUNT(Test.FundName) AS NumberOfFunds
	, CONVERT(float, SUM(Test.ISAhead)) / COUNT(Test.FundName) AS PercAhead

INTO	#Interim
	
FROM	#MedianTest AS Test
GROUP BY Test.IM
HAVING	Count(Test.FundName) >= 15
	OR Test.IM IN ('Skandia Fund Management (Ireland) Ltd'
		, 'Skandia Investment Management Ltd.'
		, 'Old Mutual Asset Managers UK Ltd.'
		, 'Old Mutual Fund Managers Limited'
		)
ORDER BY CONVERT(float, SUM(Test.ISAhead))/COUNT(Test.FundName) DESC

-------------------------------------------------------------

ALTER TABLE #Interim
ADD RANK Int NOT NULL  IDENTITY (0,1)

-------------------------------------------------------------

SET @IMs  = (SELECT MAX(RANK) FROM #interim)

-------------------------------------------------------------

SELECT	IM
	, NumberAhead
	, NumberOfFunds
	, PercAhead
	, CONVERT(float, Rank)/@IMs AS IMPercentile
	, (CASE WHEN IM IN ('Skandia Fund Management (Ireland) Ltd'
			, 'Skandia Investment Management Ltd.'
			, 'Old Mutual Asset Managers UK Ltd.'
			, 'Old Mutual Fund Managers Limited'
			) THEN 1 ELSE 0 END) AS IsOMGI
	, (CASE WHEN CONVERT(float, Rank)/@IMs IN (0, 0.25, 0.5, 0.75, 1) THEN 1 ELSE 0 END) AS IsQuartile
	, Rank

FROM	#Interim

GROUP BY 	IM
		, NumberAhead
		, NumberOfFunds
		, PercAhead
		, Rank

ORDER BY Rank


-------------------------------------------------------------


DROP Table #SMed
DROP Table #Interim
DROP Table #MedianTest