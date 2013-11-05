USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetBchkListForRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetBchkListForRawData
GO

CREATE PROCEDURE dbo.spS_GetBchkListForRawData
	@RefDate datetime

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Bchmk.Code
	, Bchmk.LongName
	, Bchmk.FactsetCode
	, Funds.BaseCCYiso AS CCY
	, Bchmk.Id AS DbId


FROM	tbl_Benchmarks AS Bchmk LEFT JOIN
		tbl_Products AS Funds ON (
		Bchmk.Id = Funds.BenchmarkId
		)

WHERE	(Funds.SoldAs NOT IN('HF', 'Mandate')
	OR Funds.SoldAs IS NULL)
	AND Funds.Id IS NOT NULL
	AND (Funds.InceptionDate < @RefDate)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))
--	AND Bchmk.FactsetCode IS NULL

	

GROUP BY Bchmk.Code
	, Bchmk.LongName
	, Bchmk.FactsetCode
	, Bchmk.Id
	, Funds.BaseCCYiso

ORDER BY 	Bchmk.Code

----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetBchkListForRawData TO [OMAM\Compliance]