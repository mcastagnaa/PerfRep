USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetBchkListSLMCForRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetBchkListSLMCForRawData
GO

CREATE PROCEDURE dbo.spS_GetBchkListSLMCForRawData
	@RefDate datetime

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Bchmk.Code
	, Bchmk.LongName
	, Bchmk.FactsetCode
	, Funds.BaseCCYiso AS CCY
	, Funds.LastPMChange
	, Bchmk.Id AS DbId

FROM	tbl_Benchmarks AS Bchmk LEFT JOIN
	tbl_Products AS Funds ON (
		Bchmk.Id = Funds.BenchmarkId
		)

WHERE	(Funds.SoldAs NOT IN('HF', 'Mandate')
	OR Funds.SoldAs IS NULL)
	AND Funds.Id IS NOT NULL
	AND (Funds.InceptionDate < @RefDate)
	AND (Funds.LastPMChange IS NOT NULL)
	AND (Funds.InceptionDate < Funds.LastPMChange)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))

	

GROUP BY Bchmk.Code
	, Bchmk.LongName
	, Bchmk.FactsetCode
	, Bchmk.Id
	, Funds.BaseCCYiso
	, Funds.LastPMChange

ORDER BY 	Bchmk.Code
		, Funds.BaseCCYiso
		, Funds.LastPMChange

----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetBchkListSLMCForRawData TO [OMAM\Compliance]