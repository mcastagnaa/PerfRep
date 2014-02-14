USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetCEOAuMTrack') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetCEOAuMTrack
GO

CREATE PROCEDURE dbo.spS_GetCEOAuMTrack
		@RefDate datetime

AS
SET NOCOUNT ON;

------------------------------------------------




SELECT	*

FROM (	SELECT	RefDate
		, OurTeam
		, AuMGBP/1000000 AS AuM

	FROM 	tbl_EoMPerfSummary
	WHERE	RefDate <= @RefDate AND
			RefDate >= DATEADD(mm, -12, @RefDate)) o

PIVOT (SUM(AuM) FOR OurTeam IN(	
					[DiscEq]
					, [ExtSStrat]
					, [FIncome]
					, [MultiAsset]
					, [SystEq]
					)
	) p

------------------------------------------------
GO
GRANT EXECUTE ON dbo.spS_GetCEOAuMTrack TO [OMAM\Compliance]
	