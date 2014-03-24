USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetCEOPerfDesk') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetCEOPerfDesk
GO

CREATE PROCEDURE dbo.spS_GetCEOPerfDesk
	@RefDate datetime
	, @Offshore bit
	, @Core bit
AS

DECLARE @PrevDate datetime
SET @PrevDate = (SELECT	MAX(RefDate) 
		FROM 	tbl_EoMPerfSummary 
		WHERE 	REfDate < @RefDate)

SET NOCOUNT ON;

------------------------------------------------

SELECT	Perf.*
INTO	#Last
FROM	tbl_EoMPerfSummary AS Perf LEFT JOIN
		tbl_Products AS Prod ON (Perf.FundId = Prod.Id)
WHERE	RefDate = @RefDate
		AND (@Offshore IS NULL OR Perf.SoldAs = 'UCITS4')
		AND (@Core IS NULL OR Prod.IsCore = 1)

------------------------------------------------

SELECT	Perf.*
INTO	#Prev
FROM	tbl_EoMPerfSummary AS Perf LEFT JOIN
		tbl_Products AS Prod ON (Perf.FundId = Prod.Id)
WHERE	RefDate = @PrevDate
		AND (@Offshore IS NULL OR Perf.SoldAs = 'UCITS4')
		AND (@Core IS NULL OR Prod.IsCore = 1)

------------------------------------------------
								-- Re-normalizing the weights
								-- Relevant when you filter by something

DECLARE @LastTotalAuMWeight float
SET @LastTotalAuMWeight = (SELECT SUM(AuMWeight) FROM #Last)

DECLARE @PrevTotalAuMWeight float
SET @PrevTotalAuMWeight = (SELECT SUM(AuMWeight) FROM #Prev)

UPDATE #Last
SET		AumWeight = AuMWeight/@LastTotalAuMWeight

UPDATE #Prev
SET		AumWeight = AuMWeight/@PrevTotalAuMWeight

------------------------------------------------

SELECT	'Perf' AS Item
	, OurTeam AS DeskGroup
	, 'Peers' AS Objective
	, '1st Q' AS Qualifier
	, SUM(CASE WHEN Quart1m = 1 THEN 1 ELSE 0 END) AS Count1m
	, SUM((CASE WHEN Quart1m = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW1m
	, SUM(CASE WHEN Quart3m = 1 THEN 1 ELSE 0 END) AS Count3m
	, SUM((CASE WHEN Quart3m = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW3m
	, SUM(CASE WHEN QuartYtD = 1 THEN 1 ELSE 0 END) AS CountYtD
	, SUM((CASE WHEN QuartYtD = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMWYtD
	, SUM(CASE WHEN Quart1y = 1 THEN 1 ELSE 0 END) AS Count1y
	, SUM((CASE WHEN Quart1y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW1y
	, SUM(CASE WHEN Quart2y = 1 THEN 1 ELSE 0 END) AS Count2y
	, SUM((CASE WHEN Quart2y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW2y
	, SUM(CASE WHEN Quart3y = 1 THEN 1 ELSE 0 END) AS Count3y
	, SUM((CASE WHEN Quart3y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW3y
	, SUM(CASE WHEN Quart5y = 1 THEN 1 ELSE 0 END) AS Count5y
	, SUM((CASE WHEN Quart5y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW5y
	, @RefDate AS RefDate
INTO	#LastPerf
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT 'Perf' 
	, OurTeam
	, 'Peers' AS Objective
	, '2nd Q'
	, SUM(CASE WHEN Quart1m = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN Quart3m = 2 THEN 1 ELSE 0 END)*AuMWeight) 
	, SUM(CASE WHEN QuartYtD = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN QuartYtD = 2 THEN 1 ELSE 0 END)*AuMWeight) 
	, SUM(CASE WHEN Quart1y = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN Quart1y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION SELECT 'Perf'
	, OurTeam
	, 'Peers'
	, '3rd Q'
	, SUM(CASE WHEN Quart1m = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3m = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN QuartYtD = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN QuartYtD = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart1y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT 'Perf'
	, OurTeam
	, 'Peers'
	, '4th Q'
	, SUM(CASE WHEN Quart1m = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3m = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN QuartYtD = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN QuartYtD = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart1y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Reference'
	, 'Fund >= Index'
	, SUM(CASE WHEN BenchRP1m >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP1m >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3m >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP3m >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRPYtD >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRPYtD >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP1y >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP1y >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP2ya >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP2ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3ya >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP5ya >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP5ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Reference'
	, 'Fund < Index'
	, SUM(CASE WHEN BenchRP1m < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP1m < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3m < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3m < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRPYtD < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRPYtD < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP1y < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP1y < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP2ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP2ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP5ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP5ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Decile'
	, 'TopDec'
	, SUM(CASE WHEN Perc1m < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1m < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3m < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3m < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN PercYtD < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN PercYtD < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc1y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc2y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc2y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc5y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc5y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Decile'
	, 'BotDec'
	, SUM(CASE WHEN Perc1m > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1m > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3m > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3m > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN PercYtD > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN PercYtD > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc1y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc2y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc2y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc5y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc5y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, @RefDate AS RefDate
FROM 	#Last
GROUP BY OurTeam


------------------------------------------------

SELECT	'Perf' AS Item
	, OurTeam AS DeskGroup
	, 'Peers' AS Objective
	, '1st Q' AS Qualifier
	, SUM(CASE WHEN Quart1m = 1 THEN 1 ELSE 0 END) AS Count1m
	, SUM((CASE WHEN Quart1m = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW1m
	, SUM(CASE WHEN Quart3m = 1 THEN 1 ELSE 0 END) AS Count3m
	, SUM((CASE WHEN Quart3m = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW3m
	, SUM(CASE WHEN QuartYtD = 1 THEN 1 ELSE 0 END) AS CountYtD
	, SUM((CASE WHEN QuartYtD = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMWYtD
	, SUM(CASE WHEN Quart1y = 1 THEN 1 ELSE 0 END) AS Count1y
	, SUM((CASE WHEN Quart1y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW1y
	, SUM(CASE WHEN Quart2y = 1 THEN 1 ELSE 0 END) AS Count2y
	, SUM((CASE WHEN Quart2y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW2y
	, SUM(CASE WHEN Quart3y = 1 THEN 1 ELSE 0 END) AS Count3y
	, SUM((CASE WHEN Quart3y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW3y
	, SUM(CASE WHEN Quart5y = 1 THEN 1 ELSE 0 END) AS Count5y
	, SUM((CASE WHEN Quart5y = 1 THEN 1 ELSE 0 END)*AuMWeight) AS AuMW5y
	, @PrevDate AS RefDate
INTO	#PrevPerf
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT 'Perf' 
	, OurTeam
	, 'Peers'
	, '2nd Q'
	, SUM(CASE WHEN Quart1m = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN Quart3m = 2 THEN 1 ELSE 0 END)*AuMWeight) 
	, SUM(CASE WHEN QuartYtD = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN QuartYtD = 2 THEN 1 ELSE 0 END)*AuMWeight) 
	, SUM(CASE WHEN Quart1y = 2 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN Quart1y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 2 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 2 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION SELECT 'Perf'
	, OurTeam
	, 'Peers'
	, '3rd Q'
	, SUM(CASE WHEN Quart1m = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3m = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN QuartYtD = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN QuartYtD = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart1y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 3 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 3 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT 'Perf'
	, OurTeam
	, 'Peers'
	, '4th Q'
	, SUM(CASE WHEN Quart1m = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1m = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3m = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3m = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN QuartYtD = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN QuartYtD = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart1y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart1y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart2y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart2y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart3y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart3y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Quart5y = 4 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Quart5y = 4 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Reference'
	, 'Fund >= Index'
	, SUM(CASE WHEN BenchRP1m >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP1m >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3m >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP3m >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRPYtD >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRPYtD >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP1y >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP1y >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP2ya >= 0 THEN 1 ELSE 0 END) 
	, SUM((CASE WHEN BenchRP2ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3ya >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP5ya >= 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP5ya >= 0 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Reference'
	, 'Fund < Index'
	, SUM(CASE WHEN BenchRP1m < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP1m < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3m < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3m < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRPYtD < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRPYtD < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP1y < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP1y < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP2ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP2ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP3ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP3ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN BenchRP5ya < 0 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN BenchRP5ya < 0 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Decile'
	, 'TopDec'
	, SUM(CASE WHEN Perc1m < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1m < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3m < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3m < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN PercYtD < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN PercYtD < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc1y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc2y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc2y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc5y < 0.1 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc5y < 0.1 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam

UNION  SELECT	'Perf'
	, OurTeam
	, 'Decile'
	, 'BotDec'
	, SUM(CASE WHEN Perc1m > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1m > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3m > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3m > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN PercYtD > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN PercYtD > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc1y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc1y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc2y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc2y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc3y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc3y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, SUM(CASE WHEN Perc5y > 0.9 THEN 1 ELSE 0 END)
	, SUM((CASE WHEN Perc5y > 0.9 THEN 1 ELSE 0 END)*AuMWeight)
	, @PrevDate AS RefDate
FROM 	#Prev
GROUP BY OurTeam


--SELECT * FROM #LastPerf
--SELECT * FROM #PrevPerf

------------------------------------------------

SELECT	ISNULL(L.Item, P.Item) AS Item
	, Desk.LongName AS DeskGroup
	, ISNULL(L.DeskGroup, P.DeskGroup) AS DeskCode
	, ISNULL(L.Objective, P.Objective) AS Objective
	, ISNULL(L.Qualifier, P.Qualifier) AS Qualifier
	, L.RefDate
	, P.RefDate AS PrevDate
	, L.Count1m
	, P.Count1m AS PCount1m
	, (CASE WHEN L.Count1m > P.Count1m THEN 'h'
			WHEN L.Count1m < P.Count1m THEN 'i' ELSE NULL END) AS Count1mArr
	, L.AuMW1m
	, P.AuMW1m AS PAuMW1m
	, (CASE WHEN L.AuMW1m > P.AuMW1m THEN 'h'
			WHEN L.AuMW1m < P.AuMW1m THEN 'i' ELSE NULL END) AS AuM1mArr

	, L.Count3m
	, P.Count3m AS PCount3m
	, (CASE WHEN L.Count3m > P.Count3m THEN 'h'
			WHEN L.Count3m < P.Count3m THEN 'i' ELSE NULL END) AS Count3mArr
	, L.AuMW3m
	, P.AuMW3m AS PAuMW3m
	, (CASE WHEN L.AuMW3m > P.AuMW3m THEN 'h'
			WHEN L.AuMW3m < P.AuMW3m THEN 'i' ELSE NULL END) AS AuM3mArr

	, L.CountYtD
	, P.CountYtD AS PCountYtD
	, (CASE WHEN L.CountYtD > P.CountYtD THEN 'h'
			WHEN L.CountYtD < P.CountYtD THEN 'i' ELSE NULL END) AS CountYtDArr
	, L.AuMWYtD
	, P.AuMWYtD AS PAuMwYtD
	, (CASE WHEN L.AuMWYtD > P.AuMWYtD THEN 'h'
			WHEN L.AuMWYtD < P.AuMWYtD THEN 'i' ELSE NULL END) AS AuMYtDArr

	, L.Count1y
	, P.Count1y AS PCount1y
	, (CASE WHEN L.Count1y > P.Count1y THEN 'h'
			WHEN L.Count1y < P.Count1y THEN 'i' ELSE NULL END) AS Count1yArr
	, L.AuMW1y
	, P.AuMW1y AS PAuMW1y
	, (CASE WHEN L.AuMW1y > P.AuMW1y THEN 'h'
			WHEN L.AuMW1y < P.AuMW1y THEN 'i' ELSE NULL END) AS AuM1yArr

	, L.Count2y
	, P.Count2y AS PCount2y
	, (CASE WHEN L.Count2y > P.Count2y THEN 'h'
			WHEN L.Count2y < P.Count2y THEN 'i' ELSE NULL END) AS Count2yArr
	, L.AuMW2y
	, P.AuMW2y AS PAuMW2y
	, (CASE WHEN L.AuMW2y > P.AuMW2y THEN 'h'
			WHEN L.AuMW2y < P.AuMW2y THEN 'i' ELSE NULL END) AS AuM2yArr

	, L.Count3y
	, P.Count3y AS PCount3y
	, (CASE WHEN L.Count3y > P.Count3y THEN 'h'
			WHEN L.Count3y < P.Count3y THEN 'i' ELSE NULL END) AS Count3yArr
	, L.AuMW3y
	, P.AuMW3y AS PAuMW3y
	, (CASE WHEN L.AuMW3y > P.AuMW3y THEN 'h'
			WHEN L.AuMW3y < P.AuMW3y THEN 'i' ELSE NULL END) AS AuM3yArr

	, L.Count5y
	, P.Count5y AS PCount5y
	, (CASE WHEN L.Count5y > P.Count5y THEN 'h'
			WHEN L.Count5y < P.Count5y THEN 'i' ELSE NULL END) AS Count5yArr
	, L.AuMW5y
	, P.AuMW5y AS PAuMW5y
	, (CASE WHEN L.AuMW5y > P.AuMW5y THEN 'h'
			WHEN L.AuMW5y < P.AuMW5y THEN 'i' ELSE NULL END) AS AuM5yArr

FROM	#LastPerf AS L FULL JOIN
		#PrevPerf AS P ON (
			L.Item = P.Item
			AND L.DeskGroup = P.DeskGroup
			AND L.Qualifier = P.Qualifier
			AND L.Objective = P.Objective
		) LEFT JOIN
		tbl_Desks AS Desk ON 
		ISNULL(L.DeskGroup, P.DeskGroup) = Desk.Code

------------------------------------------------

DROP TABLE #Last
DROP TABLE #Prev
DROP TABLE #LastPerf
DROP TABLE #PrevPerf

------------------------------------------------
GO
GRANT EXECUTE ON dbo.spS_GetCEOPerfDesk TO [OMAM\Compliance]
