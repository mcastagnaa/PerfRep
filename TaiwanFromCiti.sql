USE PerfRep
GO
--------------------------------------------------------------------------------

SELECT (CASE WHEN AssetType IN ('REVALUATION - DEBT SHORT'
			, 'RECEIVABLES'
			, 'PAYABLES'
			, 'ACCRUALS - FEES'
			, 'ACCRUED INTEREST DEBT'
			, 'CASH AND EQUIVALENTS')
				THEN 'CASH'
			ELSE AssetType END) AS NewAssetType
	, *

INTO	#TaiwAdj
				 
FROM [OMAM\Matteoc].tbl_CITIFeedForTaiwanRep

--------------------------------------------------------------------------------
UPDATE #TaiwAdj
SET AssetType = NewAssetType
--------------------------------------------------------------------------------
ALTER TABLE #TaiwAdj
DROP COLUMN NewAssetType
--------------------------------------------------------------------------------

UPDATE #TaiwAdj
SET CompanyName = 'Cash and Equivalents'
	, SecIdentifier = ''
WHERE AssetType = 'CASH'

--------------------------------------------------------------------------------

/*SELECT NewAssetType
FROM #TaiwAdj
GROUP BY NewAssetType*/

--------------------------------------------------------------------------------
SELECT Taiw.AccountName
	, SUM(Taiw.MarketValueBaseCCY) AS AuM

INTO	#AuMs

FROM #TaiwAdj AS Taiw LEFT JOIN
	tbl_Products AS Prods ON (
		Taiw.AccountCode = Prods.CitiCode
		)

WHERE 	Prods.CitiCode IN (	
				'SK03' 		-- Skandia Global Equity Fund 
				, 'SK04'	-- Skandia US Large Cap Growth Fund
				, 'SK16'	-- Skandia US Capital Growth Fund
				, 'SK14'	-- Skandia US All Cap Value Fund
				, 'SK15'	-- Skandia US Value Fund
				, 'SK06'	-- Skandia European Equity Fund
				, 'SK12'	-- Skandia European Opportunities Fund
				, 'SK22'	-- Skandia Swiss Equity Fund
				, 'SK07'	-- Skandia Japanese Equity Fund
				, 'SK05'	-- Skandia Pacific Equity Fund
				, 'SK01'	-- Skandia Greater China Equity Fund
				, 'SK02'	-- Skandia Global Bond Fund
				, 'SK21'	-- Skandia Emerging Market Debt Fund
				, 'SK17'	-- Skandia Total Return USD Bond Fund
				, 'SK23'	-- Skandia Healthcare Fund
				, 'SK24'	-- Skandia Technology Fund			
				)

/*	AND Taiw.AssetType NOT IN (	'REVALUATION - DEBT SHORT'
					, 'RECEIVABLES'
					, 'PAYABLES'
					, 'ACCRUALS - FEES'
					, 'ACCRUED INTEREST DEBT')*/

GROUP BY Taiw.AccountName

--------------------------------------------------------------------------------

--SELECT * FROM #AuMs

--------------------------------------------------------------------------------

SELECT 	Taiw.AccountName
	, '"' + Taiw.SecIdentifier + '"' AS SecIdentifier 
	, Taiw.CompanyName AS ["Security description"]
	, SUM(Taiw.MarketValueBaseCCY) AS ["MARKET VALUE FUND CCY"]
	, SUM(Taiw.MarketValueBaseCCY/AuMs.AuM) AS ["% Asset"]
--	, SUM(ISNULL(CAST(Taiw.ContractSize AS float), 1) * Taiw.Units) AS Exposure
	, Taiw.Units
	, Taiw.AssetType
	, Taiw.CCY AS ["LOCAL CCY"]
	, Taiw.Domicile
	, '' AS ["Security rating"]
	, IndustrySectorName AS ["Economic Sector"]
	, '' AS ["Exchange"]
--	, SUM(Taiw.Units) AS Units
	, SUM(Taiw.MarketValueLocal) AS MarketValueLocal
	, AVG(Taiw.PriceLocal) As Price
	, NaVDate AS ReferenceDate


FROM 	#TaiwAdj AS Taiw LEFT JOIN
	tbl_Products AS Prods ON (
		Taiw.AccountCode = Prods.CitiCode
		) LEFT JOIN
	#AuMs AS AuMs ON (
		Taiw.AccountName = AuMs.AccountName
		)

WHERE 	Prods.CitiCode IN (	
				'SK03' 		-- Skandia Global Equity Fund 
				, 'SK04'	-- Skandia US Large Cap Growth Fund
				, 'SK16'	-- Skandia US Capital Growth Fund
				, 'SK14'	-- Skandia US All Cap Value Fund
				, 'SK15'	-- Skandia US Value Fund
				, 'SK06'	-- Skandia European Equity Fund
				, 'SK12'	-- Skandia European Opportunities Fund
				, 'SK22'	-- Skandia Swiss Equity Fund
				, 'SK07'	-- Skandia Japanese Equity Fund
				, 'SK05'	-- Skandia Pacific Equity Fund
				, 'SK01'	-- Skandia Greater China Equity Fund
				, 'SK02'	-- Skandia Global Bond Fund
				, 'SK21'	-- Skandia Emerging Market Debt Fund
				, 'SK17'	-- Skandia Total Return USD Bond Fund
				, 'SK23'	-- Skandia Healthcare Fund
				, 'SK24'	-- Skandia Technology Fund			
				)	

/*	AND Taiw.AssetType NOT IN (	'REVALUATION - DEBT SHORT'
					, 'RECEIVABLES'
					, 'PAYABLES'
					, 'ACCRUALS - FEES'
					, 'ACCRUED INTEREST DEBT')*/
/*
	THIS WILL INCLUDE: 
		EQUITIES
		OPTIONS
		FUTURES
		SWAPS
		BONDS
		CASH AND EQUIVALENTS
	*/
	
	AND Taiw.NavDate = '28 Sep 2012'

GROUP BY	Taiw.AccountName
		, Taiw.SecIdentifier
		, Taiw.CompanyName
		, Prods.PublicId
		, Prods.CitiCode
		, Taiw.NaVDate
		, Taiw.BaseCurrency
		, Taiw.AssetType
		, Taiw.CCY
		, Taiw.Domicile
		, IndustrySectorName

ORDER BY	Prods.CitiCode, Taiw.AssetType, Taiw.CCY


/*SELECT SUM(["% Asset"])
	, AccountName

FROM #TMP
GROUP BY AccountName*/

--TESTING AUMS
/*SELECT * FROM #AuMs
SELECT Taiw.AccountName, SUM(Taiw.MarketValueBaseCCY) AS TestAUM
FROM #TaiwAdj AS Taiw

GROUP BY Taiw.AccountName*/

-------------------------------------------------------------------------

DROP TABLE #TaiwAdj
DROP TABLE #AuMs