USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_ScopeNCCFRep') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_ScopeNCCFRep
GO

CREATE PROCEDURE dbo.spS_ScopeNCCFRep
		@RefDate datetime

AS

SET NOCOUNT ON;

--== Logic to determine the funds in scope (top by AuM and ad-hoc)
-- top by AuM
SELECT TOP 12 P.Id AS FundId
		, P.ShortCode
		, P.FundName
		, P.PublicId AS ISIN
		, AuM.AuMGBP
INTO	#ScopeFunds
FROM	tbl_FinanceAuM AS AuM LEFT JOIN
		tbl_Products AS P ON (
			P.FinanceName = AuM.FinanceName
			)
WHERE	RefDate = @RefDate
		AND P.ShortCode NOT IN ('SKINTGRW','SKGDEQ', 'SKHYLDBND',
			'SKCBND', 'SKUKSEL', 'SKUKOPP', 'SKGBPBND', 'SKINTDIV',
			'SKNEWMNG', 'SKGILT', 'SKUKINDX')
		AND P.SelectRefISIN IS NULL
		AND P.SoldAS NOT IN ('Mandate', 'HF')
		AND P.InceptionDate < DATEADD(mm, -12, @RefDate)
ORDER BY AuMGBP DESC

-- ad-hoc
--INSERT INTO #ScopeFunds
--SELECT P.Id AS FundId
--		, P.ShortCode
--		, P.FundName
--		, P.PublicId AS ISIN
--		, AuM.AuMGBP
--
--FROM	tbl_FinanceAuM AS AuM LEFT JOIN
--		tbl_Products AS P ON (
--			P.FinanceName = AuM.FinanceName
--			)
--WHERE	RefDate = @RefDate
--		AND P.ShortCode IN ('EQIO')

--== Get the relevant peer group details
SELECT	P.FundId
		, P.ShortCode AS FundCode
		, P.FundName
		, P.ISIN
		, P.AuMGBP
		, PG.Classification
		, ISNULL(PG.Sector, 'Unclassified') AS Sector
		, PG.FileName

FROM	#ScopeFunds AS P LEFT JOIN
		vw_AllPeersDefs AS PG ON (
			P.FundId = PG.FundId
			)
GROUP BY	P.FundId
			, P.ShortCode
			, P.ISIN
			, P.FundName
			, PG.Classification
			, PG.Sector
			, PG.FileName
			, P.AuMGBP

ORDER BY	P.AuMGBP DESC

----------------------------------------------------

DROP TABLE #ScopeFunds

----------------------------------------------------------------------------------

GO
GRANT EXECUTE ON dbo.spS_ScopeNCCFRep TO [OMAM\Compliance]