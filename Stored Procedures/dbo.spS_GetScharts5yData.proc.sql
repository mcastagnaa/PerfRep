USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetScharts5yData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetScharts5yData
GO

CREATE PROCEDURE dbo.spS_GetScharts5yData
	@RefDate datetime

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

DECLARE @IMs AS Int
--[OMAM\Matteoc].

-------------------------------------------------------------

SELECT	MStarCategory
	, AVG([5yCum]) AS MedianReturn

INTO	#SMed
FROM
	(
	SELECT	MStarCategory
		, [5yCum]
		, ROW_NUMBER() OVER (
			PARTITION BY MStarCategory
			ORDER BY [5yCum] ASC, FundName ASC) AS RowAsc
		, ROW_NUMBER() OVER (
			PARTITION BY MStarCategory
			ORDER BY [5yCum] DESC, FundName DESC) AS RowDesc
	FROM [OMAM\Matteoc].tbl_SCHARTSrawdata
	WHERE [5yCum] IS NOT NULL 
		AND RefDate = @RefDate
	) X
	WHERE RowAsc IN (RowDesc, RowDesc - 1, RowDesc + 1) 
	GROUP BY MstarCategory
--	ORDER BY MstarCategory

-------------------------------------------------------------

SELECT	Dset.IM
	, DSet.FundName
	, DSet.[5yCum]
	, DSet.MStarCategory
	, SMed.MedianReturn
	, (CASE WHEN Dset.[5yCum] >= SMed.MedianReturn THEN 1
		ELSE 0 END) AS ISAhead
	
INTO	#MedianTest

FROM	tbl_SCHARTSRawdata AS DSet LEFT JOIN
		#SMed AS SMed ON (
		DSet.MStarCategory = SMed.MStarCategory
		)

WHERE	DSet.[5yCum] IS NOT NULL
	AND Dset.refDate = @RefDate
	
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
	, (CASE 
		WHEN Rank IN (0, ROUND(@IMs/4,0), ROUND(@IMs/2,0), ROUND(@IMs/4*3,2), @IMs) 
			THEN 1 
		ELSE 0 END) AS IsQuartile
	, Rank

INTO	#TableData

FROM	#Interim

GROUP BY 	IM
		, NumberAhead
		, NumberOfFunds
		, PercAhead
		, Rank

ORDER BY Rank


-------------------------------------------------------------

SELECT	'5yr' AS ReturnPeriod
	, IM
	, NumberOfFunds AS IMNoOfFunds
	, PercAhead AS FundsAheadOfMedian
	, ROUND(IMPercentile, 2) AS IMPercentile
	, ISOMGI
	, ISQuartile

FROM 	#TableData
WHERE	IsOMGI = 1
	OR IsQuartile = 1

-------------------------------------------------------------

DROP Table #SMed
DROP Table #Interim
DROP Table #MedianTest
DROP Table #TableData


----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetScharts5yData TO [OMAM\Compliance]