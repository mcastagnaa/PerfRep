USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetCEOHistCharts') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetCEOHistCharts
GO

CREATE PROCEDURE dbo.spS_GetCEOHistCharts
	@RefDate datetime, 
	@OurTeam nvarchar(25)
AS

SET NOCOUNT ON;

SELECT RefDate
		, SUM(CASE WHEN Quart1m < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct1m		
		, SUM(CASE WHEN Quart1m < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN 1 ELSE 0 END) AS No50pct1m
		, SUM(CASE WHEN Quart1m = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct1m
		, SUM(CASE WHEN Quart1m = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN 1 ELSE 0 END) AS No25pct1m
		, SUM(CASE WHEN Quart1m = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct1m
		, SUM(CASE WHEN Quart1m = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1m IS NOT NULL THEN 1 ELSE 0 END) AS No75pct1m
		, SUM(CASE WHEN Quart1m IS NOT NULL THEN 1 ELSE 0 END) AS CovNo1m
		, SUM(CASE WHEN Quart1m IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt1m

		, SUM(CASE WHEN Quart3m < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct3m		
		, SUM(CASE WHEN Quart3m < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN 1 ELSE 0 END) AS No50pct3m
		, SUM(CASE WHEN Quart3m = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct3m
		, SUM(CASE WHEN Quart3m = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN 1 ELSE 0 END) AS No25pct3m
		, SUM(CASE WHEN Quart3m = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct3m
		, SUM(CASE WHEN Quart3m = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3m IS NOT NULL THEN 1 ELSE 0 END) AS No75pct3m
		, SUM(CASE WHEN Quart3m IS NOT NULL THEN 1 ELSE 0 END) AS CovNo3m
		, SUM(CASE WHEN Quart3m IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt3m

		, SUM(CASE WHEN QuartYtD < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pctYtD		
		, SUM(CASE WHEN QuartYtD < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN 1 ELSE 0 END) AS No50pctYtD
		, SUM(CASE WHEN QuartYtD = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pctYtD
		, SUM(CASE WHEN QuartYtD = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN 1 ELSE 0 END) AS No25pctYtD
		, SUM(CASE WHEN QuartYtD = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pctYtD
		, SUM(CASE WHEN QuartYtD = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN QuartYtD IS NOT NULL THEN 1 ELSE 0 END) AS No75pctYtD
		, SUM(CASE WHEN QuartYtD IS NOT NULL THEN 1 ELSE 0 END) AS CovNoYtD
		, SUM(CASE WHEN QuartYtD IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgtYtD


		, SUM(CASE WHEN Quart1y < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct1y		
		, SUM(CASE WHEN Quart1y < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN 1 ELSE 0 END) AS No50pct1y
		, SUM(CASE WHEN Quart1y = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct1y
		, SUM(CASE WHEN Quart1y = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN 1 ELSE 0 END) AS No25pct1y
		, SUM(CASE WHEN Quart1y = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct1y
		, SUM(CASE WHEN Quart1y = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart1y IS NOT NULL THEN 1 ELSE 0 END) AS No75pct1y
		, SUM(CASE WHEN Quart1y IS NOT NULL THEN 1 ELSE 0 END) AS CovNo1y
		, SUM(CASE WHEN Quart1y IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt1y


		, SUM(CASE WHEN Quart2y < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct2y		
		, SUM(CASE WHEN Quart2y < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN 1 ELSE 0 END) AS No50pct2y
		, SUM(CASE WHEN Quart2y = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct2y
		, SUM(CASE WHEN Quart2y = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN 1 ELSE 0 END) AS No25pct2y
		, SUM(CASE WHEN Quart2y = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct2y
		, SUM(CASE WHEN Quart2y = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart2y IS NOT NULL THEN 1 ELSE 0 END) AS No75pct2y
		, SUM(CASE WHEN Quart2y IS NOT NULL THEN 1 ELSE 0 END) AS CovNo2y
		, SUM(CASE WHEN Quart2y IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt2y


		, SUM(CASE WHEN Quart3y < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct3y		
		, SUM(CASE WHEN Quart3y < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN 1 ELSE 0 END) AS No50pct3y
		, SUM(CASE WHEN Quart3y = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct3y
		, SUM(CASE WHEN Quart3y = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN 1 ELSE 0 END) AS No25pct3y
		, SUM(CASE WHEN Quart3y = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct3y
		, SUM(CASE WHEN Quart3y = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart3y IS NOT NULL THEN 1 ELSE 0 END) AS No75pct3y
		, SUM(CASE WHEN Quart3y IS NOT NULL THEN 1 ELSE 0 END) AS CovNo3y
		, SUM(CASE WHEN Quart3y IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt3y


		, SUM(CASE WHEN Quart5y < 3 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt50pct5y		
		, SUM(CASE WHEN Quart5y < 3 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN 1 ELSE 0 END) AS No50pct5y
		, SUM(CASE WHEN Quart5y = 1 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt25pct5y
		, SUM(CASE WHEN Quart5y = 1 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN 1 ELSE 0 END) AS No25pct5y
		, SUM(CASE WHEN Quart5y = 4 THEN AuMWeight ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN AuMWeight ELSE 0 END) AS Wgt75pct5y
		, SUM(CASE WHEN Quart5y = 4 THEN 1.0 ELSE 0 END)/ 
				SUM(CASE WHEN Quart5y IS NOT NULL THEN 1 ELSE 0 END) AS No75pct5y
		, SUM(CASE WHEN Quart5y IS NOT NULL THEN 1 ELSE 0 END) AS CovNo5y
		, SUM(CASE WHEN Quart5y IS NOT NULL THEN AuMWeight ELSE 0 END) AS CovWgt5y

FROM	tbl_EoMPerfSummary AS Perf JOIN
		tbl_Products AS Prod ON (Prod.Id = Perf.FundId)

WHERE	Prod.SelectRefISIN IS NULL
		AND (Prod.OurTeam = @OurTeam OR @OurTeam IS NULL)
		AND RefDate <= @RefDate
--		AND Prod.SoldAS = 'UCITS4'
--		AND Prod.IsCore = 1

GROUP BY RefDate
ORDER BY RefDate

----------------------------------------------------

GO
GRANT EXECUTE ON dbo.spS_GetCEOHistCharts TO [OMAM\Compliance]
