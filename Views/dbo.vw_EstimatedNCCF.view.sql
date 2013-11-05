USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_EstimatedNCCF]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_EstimatedNCCF]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_EstimatedNCCF]
AS 


WITH Dates_CTE (RefDate, PrevDate, ShortCode)
	AS
	(
	SELECT A.RefDate
			, (SELECT MAX(RefDate) 
				FROM tbl_FinanceAuM 
				WHERE RefDate < A.RefDate) AS PrevDate
			, P.ShortCode
	FROM tbl_FinanceAuM AS A, tbl_Products AS P
	WHERE	A.RefDate > '2012 Dec 31'
	GROUP BY A.RefDate, P.ShortCode
	)


SELECT	P.Id AS FundId
		, P.Company
		, CTE.ShortCode AS FundCode
		, D.LongName AS DeskName
		, P.OurTeam AS DeskCode
		, P.OurPM AS PM
		, P.FundName
		, CTE.RefDate
		, ISNULL(Last.AuMGBP, 0)  AS LastAuM
		, CTE.PrevDate
		, ISNULL(Prev.AuMGBP, 0) AS PrevAuM
		, ISNULL(Last.AuMGBP,0) - ISNULL(Prev.AuMGBP,0) AS Diff
		, (CASE WHEN Last.AuMGBP IS NULL THEN -1
				WHEN Prev.AuMGBP IS NULL THEN +1
				ELSE (Last.AuMGBP/Prev.AuMGBP - 1)
				END) AS DiffPerc
		, Perf.NP1m/100 AS FundPerf
		, ISNULL(Last.AuMGBP,0)/NULLIF(Prev.AuMGBP,0) - 1 - Perf.NP1m/100
				AS NCCFEstimate
		, (CASE WHEN Last.AuMGBP IS NULL THEN -Prev.AuMGBP
				WHEN Prev.AuMGBP IS NULL THEN Last.AuMGBP
				ELSE Prev.AuMGBP * (Last.AuMGBP/Prev.AuMGBP - 1 - Perf.NP1m/100)
				END) AS NCCFEstimCash

FROM 	Dates_CTE AS CTE LEFT JOIN
		tbl_FinanceAuM AS Last ON 
			(Last.RefDate = CTE.RefDate
			AND Last.ShortCode = CTE.ShortCode)
		LEFT JOIN tbl_FinanceAuM AS Prev ON 
			(Prev.RefDate = CTE.PrevDate
			AND Prev.ShortCode = CTE.ShortCode) 
		JOIN tbl_Products AS P ON 
			(CTE.ShortCode = P.ShortCode) 
		JOIN tbl_Desks AS D ON
			(P.OurTeam = D.Code)
		LEFT JOIN tbl_FundsPerfs AS Perf ON (
			P.id = Perf.Fundid
			AND CTE.RefDate = Perf.RefDate
			)
WHERE	(Last.AuMGBP IS NOT NULL OR Prev.AuMGBP IS NOT NULL)
		--AND CTE.ShortCode IN ( 'IPAC', 'ARBEA')
		--AND CTE.RefDate = '2013 Aug 31'

--ORDER BY CTE.ShortCode, CTE.RefDate		
