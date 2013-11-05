USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_CheckFinanceAuMData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_CheckFinanceAuMData
GO

CREATE PROCEDURE dbo.spS_CheckFinanceAuMData
	@RefDate datetime

AS
----------------------------------------------------------------------------------

SELECT * FROM vw_EstimatedNCCF
WHERE RefDate = @RefDate

----------------------------------------------------------------------------------

GO

GRANT EXECUTE ON dbo.spS_CheckFinanceAuMData TO [OMAM\Compliance]