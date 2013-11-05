USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetTCFBench') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetTCFBench
GO

CREATE PROCEDURE dbo.spS_GetTCFBench
	@RefDate datetime

AS

SET NOCOUNT ON;
	


DECLARE	@PrevDate datetime
SET @PrevDate = (SELECT MAX(RefDate) FROM tbl_TCFBench WHERE RefDate < @RefDate)

EXEC	dbo.spS_GetTCFBenchTest @RefDate
--EXEC	dbo.spS_GetTCFBenchTest @PrevDate

--------------------------------------------
SELECT * 
INTO	#LastSet
FROM 	tbl_TCFBench
WHERE	RefDate = @RefDate
--------------------------------------------
SELECT * 
INTO	#PrevSet
FROM 	tbl_TCFBench
WHERE	RefDate = @PrevDate
--------------------------------------------

SELECT	L.RefDate 
	, L.Item
	, P.RefDate AS PrevDate
	, L.FundId
	, L.FundAndIndex
	, L.PrimaryObj
	, L.Company
	, L.OurTeam
	, L.OurPM
	, L.Label1y
	, L.Label3y
	, L.Label5y
	, L.LabelBlend
	, L.Label5yAbs
	, L.Test1y
	, P.Test1y AS Prev1y
	, L.Test3y
	, P.Test3y AS Prev3y
	, L.Test5y
	, P.Test5y AS Prev5y
	, L.BlendRAG
	, P.BlendRAG AS PrevBlend
	, L.Test5yAbs
	, P.Test5yAbs AS Prev5yAbs
	
FROM 	#LastSet AS L LEFT JOIN
	#PrevSet AS P ON (
		L.FundId = P.FundId
		)

--------------------------------------------
DROP Table #LastSet
DROP Table #PrevSet
GO 
--------------------------------------------
GRANT EXECUTE ON spS_GetTCFBench TO [OMAM\Compliance]
