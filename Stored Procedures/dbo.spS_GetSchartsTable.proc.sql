USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetSchartsTable') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetSchartsTable
GO

CREATE PROCEDURE dbo.spS_GetSchartsTable
	@RefDate datetime

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------


CREATE TABLE #FullSet (
ReturnPeriod nvarchar(10)
, IM nvarchar(100)
, IMNoOfFunds integer
, FundsAheadOfMedian float
, IMPercentile float 
, ISOMGI integer
, ISQuartile integer
)

-------------------------------------------------------------------

INSERT INTO #FullSet
EXEC dbo.spS_GetScharts1yData @RefDate

INSERT INTO #FullSet
EXEC dbo.spS_GetScharts2yData @RefDate

INSERT INTO #FullSet
EXEC dbo.spS_GetScharts3yData @RefDate

INSERT INTO #FullSet
EXEC dbo.spS_GetScharts5yData @RefDate

----------------------------------------------------------------------------------
SELECT * FROM #FullSet

----------------------------------------------------------------------------------
DROP TABLE #FullSet
GO

----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetSchartsTable TO [OMAM\Compliance]