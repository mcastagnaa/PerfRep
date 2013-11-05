USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetTCFPeer') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetTCFPeer
GO

CREATE PROCEDURE dbo.spS_GetTCFPeer
	@RefDate datetime

AS

SET NOCOUNT ON;

DECLARE	@PrevDate datetime
SET @PrevDate = (SELECT MAX(RefDate) FROM tbl_TCFPeer WHERE RefDate < @RefDate)

EXEC	dbo.spS_GetTCFPeerTest @RefDate
--EXEC	dbo.spS_GetTCFBenchTest @PrevDate

--------------------------------------------
SELECT * 
INTO	#LastSet
FROM 	tbl_TCFPeer
WHERE	RefDate = @RefDate
--------------------------------------------
SELECT * 
INTO	#PrevSet
FROM 	tbl_TCFPeer
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
	, L.Test1y
	, P.Test1y AS TPrev1y
	, L.Perc1y
	, P.Perc1y AS Prev1y
	, L.Test3y
	, P.Test3y AS TPrev3y
	, L.Perc3y
	, P.Perc3y AS Prev3y
	, L.Test5y
	, P.Test5y AS TPrev5y
	, L.Perc5y
	, P.Perc5y AS Prev5y
	, L.BlendRAG
	, P.BlendRAG AS PrevBlend
	
FROM 	#LastSet AS L LEFT JOIN
	#PrevSet AS P ON (
		L.FundId = P.FundId
		)

--------------------------------------------
DROP Table #LastSet
DROP Table #PrevSet
GO 
--------------------------------------------
GRANT EXECUTE ON spS_GetTCFPeer TO [OMAM\Compliance]
	