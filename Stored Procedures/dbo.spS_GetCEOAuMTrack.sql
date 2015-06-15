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
		, @OffShore bit
		, @Core bit

AS
SET NOCOUNT ON;

------------------------------------------------
SELECT	*

FROM (	SELECT	Perf.RefDate
		, Perf.OurTeam
		, Perf.AuMGBP/1000000 AS AuM

	FROM 	tbl_EoMPerfSummary AS Perf LEFT JOIN
			tbl_Products AS Prod ON (Perf.FundId = Prod.Id)
	WHERE	Perf.RefDate <= @RefDate
			AND Perf.RefDate >= DATEADD(mm, -12, @RefDate)
			AND (@offshore IS NULL OR Perf.SoldAs = 'UCITS4')
			AND (@Core IS NULL OR Prod.IsCore = 1)
			) o

PIVOT (SUM(AuM) FOR OurTeam IN(	
					[DiscEq]
					, [ExtSStrat]
					, [FIncome]
					, [MultiAsset]
					, [SystEq]
					, [AsianEq]
					, [PSnt]
					)
	) p

------------------------------------------------
GO
GRANT EXECUTE ON dbo.spS_GetCEOAuMTrack TO [OMAM\Compliance]
	