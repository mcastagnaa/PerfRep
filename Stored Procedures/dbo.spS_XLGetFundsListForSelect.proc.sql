USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetFundsListForSelect') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetFundsListForSelect
GO

CREATE PROCEDURE dbo.spS_GetFundsListForSelect
	@RefDate	datetime 
AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Funds.Id
		, Funds.ShortCode
		, Funds.FundName
		, Funds.SelectRefISIN
		, Funds.SelectRefMStar
		, Funds.InceptionDate
		, Funds.BaseCCYiso AS OurBaseCCY

FROM	tbl_Products AS Funds

WHERE	Funds.SelectRefMstar is not null
	AND (Funds.InceptionDate < @RefDate)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))

----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetFundsListForSelect TO [OMAM\Compliance]