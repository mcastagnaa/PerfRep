USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_NCCFRollingStats') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_NCCFRollingStats
GO

CREATE PROCEDURE dbo.spS_NCCFRollingStats
	@RefDate datetime
	, @YtD bit
AS

SET NOCOUNT ON;
DECLARE @FirstDate datetime

IF @YtD = 0
BEGIN
	SET @FirstDate = Dateadd(mm, -11, @RefDate)
END
ELSE
BEGIN
	DECLARE @year int
	SET @year = DATEPART(year, @RefDate)
	SET @FirstDate = CAST(@Year AS nvarchar(4)) + '/Jan/31'
END
---------------------------------------------------------
SELECT	RefDate
		, ROW_NUMBER() OVER (ORDER BY RefDate ASC) AS Row
		, SUM(NCCFEstimCash)/SUM(PrevAuM) AS MonNCCF
		, SUM(NCCFEstimCash) AS NCCFCash
INTO	#Monthly
FROM	vw_EstimatedNCCF
WHERE	RefDate >= @FirstDate
		AND RefDate <= @RefDate
GROUP BY RefDate
ORDER BY RefDate

SELECT	MAX(RefDate) AS LastDate
		, EXP(SUM(LOG(1 + MonNCCF)))-1  AS CompNCCF
		, SUM(NCCFCash) AS NCCFgbp
INTO	#Total
FROM	#Monthly
---------------------------------------------------------
SELECT	RefDate
		, DeskCode AS Desk
		, SUM(NCCFEstimCash)/SUM(PrevAuM) AS MonNCCF
		, SUM(NCCFEstimCash) AS NCCFCash
INTO	#MonthlyDesk
FROM	vw_EstimatedNCCF
WHERE	RefDate >= @FirstDate
		AND RefDate <= @RefDate
GROUP BY RefDate, DeskCode
ORDER BY DeskCode, RefDate

SELECT	Desk
		, MAX(RefDate) AS LastDate
		, EXP(SUM(LOG(1 + MonNCCF)))-1  AS CompNCCF
		, SUM(NCCFCash) AS NCCFgbp
INTO	#TotalDesk
FROM	#MonthlyDesk
GROUP BY Desk
---------------------------------------------------------
SELECT	RefDate
		, DeskCode AS Desk
		, FundCode
		, FundName 
		--, SUM(NCCFEstimCash)/nullif(SUM(PrevAuM),0) AS MonNCCF
		--, SUM(NCCFEstimCash) AS NCCFCash
		, NCCFEstimCash/nullif(PrevAuM,0) AS MonNCCF
		, NCCFEstimCash AS NCCFCash
INTO	#MonthlyFund
FROM	vw_EstimatedNCCF
WHERE	RefDate >= @FirstDate
		AND RefDate <= @RefDate
		--AND FundCode = 'SKNEWMNG'
		AND ((NCCFEstimCash/nullif(PrevAuM,0) > -2)
			OR PrevAuM = 0)
--GROUP BY RefDate, FundCode, DeskCode, FundName, PrevAuM, NCCFEstimCash
--HAVING	(NCCFEstimCash/nullif(PrevAuM,0) > -1)
--		OR PrevAuM = 0
ORDER BY RefDate

------------------------
-- Sort out funny %
UPDATE #MonthlyFund
SET MonNCCF = -0.9999999
WHERE MonNCCF <= -1
------------------------

SELECT TOP 10 ROW_NUMBER() 
        OVER (ORDER BY SUM(NCCFCash) DESC) AS Row
		, FundCode
		, FundName
		, Desk
		, MAX(RefDate) AS LastDate
		, EXP(SUM(LOG(1 + MonNCCF)))-1  AS CompNCCF
		, SUM(NCCFCash) AS NCCFgbp
INTO	#TotalFundCash
FROM	#MonthlyFund
GROUP BY FundCode, Desk, FundName
ORDER BY SUM(NCCFCash) DESC
---------------------------------------------------------
SELECT TOP 10 ROW_NUMBER() 
        OVER (ORDER BY EXP(SUM(LOG(1 + MonNCCF)))-1 DESC) AS Row
		, FundCode
		, FundName
		, Desk
		, MAX(RefDate) AS LastDate
		, EXP(SUM(LOG(1 + MonNCCF)))-1  AS CompNCCF
		, SUM(NCCFCash) AS NCCFgbp
INTO	#TotalFundPerc
FROM	#MonthlyFund
GROUP BY FundCode, Desk, FundName
ORDER BY EXP(SUM(LOG(1 + MonNCCF)))-1 DESC

---------------------------------------------------------
SELECT TOP 10 ROW_NUMBER() 
        OVER (ORDER BY SUM(NCCFCash) ASC) AS Row
		, FundCode
		, FundName
		, Desk
		, MAX(RefDate) AS LastDate
		, EXP(SUM(LOG(1 + MonNCCF)))-1  AS CompNCCF
		, SUM(NCCFCash) AS NCCFgbp
INTO	#TotalFundLoss
FROM	#MonthlyFund
GROUP BY FundCode, Desk, FundName
ORDER BY SUM(NCCFCash) ASC
---------------------------------------------------------
SELECT	1 AS Ordering
		, CAST(Row AS Int) AS ItemOrdering
		, 'Monthly' AS Item
		, 'All' AS Desk
		, '-' AS FundCode
		, '-' AS FundName
		, RefDate
		, MonNCCF AS NCCFe
		, NCCFcash
FROM	#Monthly

UNION
SELECT	2 AS Ordering
		, null AS ItemOrdering
		, 'Total'
		, 'All'
		, '-'
		, '-'
		, LastDate
		, CompNCCF
		, NCCFgbp
FROM	#Total
UNION
SELECT	3 AS Ordering
		, null AS ItemOrdering
		, 'Total by desk'
		, Desk
		, '-'
		, '-'
		, LastDate
		, CompNCCF
		, NCCFgbp
FROM	#TotalDesk
UNION
SELECT	4 AS Ordering
		, CAST(Row AS Int) AS ItemOrdering
		,'Best 10 products (by percentage)'
		, Desk
		, FundCode
		, FundName
		, LastDate
		, CompNCCF
		, NCCFgbp
FROM	#TotalFundPerc
UNION
SELECT	5 AS Ordering
		, CAST(Row AS Int) AS ItemOrdering
		,'Best 10 products (by cash)'
		, Desk
		, FundCode
		, FundName
		, LastDate
		, CompNCCF
		, NCCFgbp
FROM	#TotalFundCash
UNION
SELECT	6 AS Ordering
		, CAST(Row AS Int) AS ItemOrdering
		,'Worse 10 products (by cash)'
		, Desk
		, FundCode
		, FundName
		, LastDate
		, CompNCCF
		, NCCFgbp
FROM	#TotalFundLoss
ORDER BY Ordering ASC, ItemOrdering ASC

DROP TABLE #Monthly
DROP TABLE #MonthlyDesk
DROP TABLE #MonthlyFund
DROP TABLE #Total
DROP TABLE #TotalDesk
DROP TABLE #TotalFundCash
DROP TABLE #TotalFundPerc
DROP TABLE #TotalFundLoss

-----------------------------------------------------------------
GO

GRANT EXECUTE ON dbo.spS_NCCFRollingStats TO [OMAM\Compliance]