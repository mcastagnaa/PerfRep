USE PerfRep
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'


SELECT R.FundId
	, P.ShortCode
	, P.FundName
	, P.Company
	, P.RefShClass
	, P.InceptionDate
	, R.[NPy-5] AS [2007]
	, R.[NPy-4] AS [2008]
	, R.[NPy-3] AS [2009]
	, R.[NPy-2] AS [2010]
	, R.[NPy-1] AS [2011]
	, R.NP1y AS [2012]
	, S.LongName AS SRRICat
	, A.ProdStD5y AS SD5y
	, (CASE 
		WHEN A.ProdStD5y >= 25 THEN 7
		WHEN A.ProdStD5y >= 15 THEN 6
		WHEN A.ProdStD5y >= 10 THEN 5
		WHEN A.ProdStD5y >= 5 THEN 4
		WHEN A.ProdStD5y >= 2 THEN 3
		WHEN A.ProdStD5y >= 0.5 THEN 2
		WHEN A.ProdStD5y >= 0 THEN 1
		ELSE null 
	END) AS SRRI

FROM	[OMAM\Matteoc].tbl_FundsPerfs AS R LEFT JOIN
	[OMAM\Matteoc].tbl_FundsAnlys AS A ON (
		R.FundId = A.FundId
		AND R.RefDate = A.RefDate
		) LEFT JOIN
	tbl_Products AS P ON (
		R.FundId = P.Id
		) LEFT JOIN
	[OMAM\Matteoc].tbl_SRRIcategories AS S ON (
		P.SRRICat = S.Id
		)

WHERE 	R.RefDate = @RefDate
	AND ISNULL(P.CloseDate, @RefDaTe) >= @RefDate

ORDER BY P.SRRICat, P.Company, P.FundName