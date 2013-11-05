USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPerf1mDataByFund') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPerf1mDataByFund
GO

CREATE PROCEDURE dbo.spS_GetPerf1mDataByFund
	@RefDate datetime
	, @FundId integer
AS

SET NOCOUNT ON;

--------------------------------------------------------------

SELECT	CAST(CAST(YEAR(RefDate) AS VARCHAR(4)) + 
		RIGHT('0' + CAST(MONTH(RefDate) AS VARCHAR(2)),2) AS integer) AS YYYYMM
		, ROUND(NP1m, 2) AS NP1m
		, ROUND(Ben1m, 2) AS Ben1m
		, ROUND(NP1m - Ben1m, 2) AS ExcRet
		, (CASE WHEN PrimaryObj = 'IsraelsenRatio'
				THEN ProdIRRank1m
				ELSE ProdRank1m
				END) AS Rank1m
		, (CASE WHEN PrimaryObj = 'IsraelsenRatio'
				THEN PGIRNum1m
				ELSE PeersNo1m
				END) AS PgNo1m
		, PGmed_r1m                                    
INTO	#MonthlyData	
FROM	vw_AllPerfDataset
WHERE	Id = @FundId
		AND RefDate <= @RefDate

--------------------------------------------------------------

SELECT	YYYYMM AS Date
		, NP1m
		, Ben1m
		, ExcRet
		, Rank1m
		, PGNo1m
		, ROUND(CAST(Rank1m AS Float)/PGNo1m,2)*100 AS Percentile
		, dbo.fn_GetQuartile(CAST(Rank1m AS Float)/PGNo1m, 1) AS Quartile

FROM	#MonthlyData
ORDER BY YYYYMM DESC

--------------------------------------------------------------

DROP TABLE #MonthlyData
GO

--------------------------------------------------------------

GRANT EXECUTE ON dbo.spS_GetPerf1mDataByFund TO [OMAM\Compliance]

