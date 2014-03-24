USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetCEOCharts') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetCEOCharts
GO

CREATE PROCEDURE dbo.spS_GetCEOCharts
	@RefDate datetime
	, @Offshore bit
	, @Core bit
AS

SET NOCOUNT ON;

CREATE TABLE #AuMStats (
	Item 			nvarchar(50)
	, DeskName		nvarchar(100)
	, DeskGroup		nvarchar(50)
	, Objective		nvarchar(50)
	, Qualifier		nvarchar(50)
	, RefDate		datetime
	, PrevDate		datetime
	, Number		integer
	, TotalAuM		float
	, TotalAuMW		float
	, QCount1m		integer
	, QAuM1m		float	
	, QAuMW1m		float
	, QCount3m		integer
	, QAuM3m		float
	, QAuMW3m		float
	, QCountYtD		integer
	, QAuMYtD		float
	, QAuMWYtD		float
	, QCount1y		integer
	, QAuM1y		float
	, QAuMW1y		float
	, QCount2y		integer
	, QAuM2y		float
	, QAuMW2y		float
	, QCount3y		integer
	, QAuM3y		float
	, QAuMW3y		float
	, QCount5y		integer
	, QAuM5y		float
	, QAuMW5y		float
	, BCount1m		integer
	, BAuM1m		float
	, BAuMW1m		float
	, BCount3m		integer
	, BAuM3m		float
	, BAuMW3m		float
	, BCountYtD		integer
	, BAuMYtD		float
	, BAuMWYtD		float
	, BCount1y		integer
	, BAuM1y		float
	, BAuMW1y		float
	, BCount2y		integer
	, BAuM2y		float
	, BAuMW2y		float
	, BCount3y		integer
	, BAuM3y		float
	, BAuMW3y		float
	, BCount5y		integer
	, BAuM5y		float
	, BAuMW5y		float
	, PNumber		integer
	, PTotalAuM		float
	, PTotalAuMW		float
	, PQCount1m		integer
	, PQAuM1m		float
	, PQAuMW1m		float
	, PQCount3m		integer
	, PQAuM3m		float
	, PQAuMW3m		float
	, PQCountytD		integer
	, PQAuMYtD		float
	, PQAuMWYtD		float
	, PQCount1y		integer
	, PQAuM1y		float
	, PQAuMW1y		float
	, PQCount2y		integer
	, PQAuM2y		float
	, PQAuMW2y		float
	, PQCount3y		integer
	, PQAuM3y		float
	, PQAuMW3y		float
	, PQCount5y		integer
	, PQAuM5y		float
	, PQAuMW5y		float
	, PBCount1m		integer
	, PBAuM1m		float
	, PBAuMW1m		float
	, PBCount3m		integer
	, PBAuM3m		float
	, PBAuMW3m		float
	, PBCountYtD		integer
	, PBAuMYtD		float
	, PBAuMwYtD		float
	, PBCount1y		integer
	, PBAuM1y		float
	, PBAuMW1y		float
	, PBCount2y		integer
	, PBAuM2y		float
	, PBAuMW2y		float
	, PBCount3y		integer
	, PBAuM3y		float
	, PBAuMW3y		float
	, PBCount5y		integer
	, PBAuM5y		float
	, PBAuMW5y		float
)

-----------------------------------------------------------

INSERT INTO #AuMStats
EXEC dbo.spS_GetCEOAuMOverall @RefDate, @Offshore, @Core

-----------------------------------------------------------


CREATE TABLE #PerfStats (
	Item 			nvarchar(50)
	, DeskName		nvarchar(100)
	, DeskGroup		nvarchar(50)
	, Objective		nvarchar(50)
	, Qualifier		nvarchar(50)
	, RefDate		datetime
	, PrevDate		datetime
	, Count1m		integer
	, PCount1m		integer
	, Count1mArr	nvarchar(1)
	, AuMW1m		float
	, PAuMW1m		float
	, AuMW1mArr		nvarchar(1)
	, Count3m		integer
	, PCount3m		integer
	, Count3mArr	nvarchar(1)
	, AuMW3m		float
	, PAuMW3m		float
	, AuMW3mArr		nvarchar(1)
	, CountYtD		integer
	, PCountYtD		integer
	, CountYtDArr	nvarchar(1)
	, AuMwYtD		float
	, PAuMwYtD		float
	, AuMWYtDArr	nvarchar(1)
	, Count1y		integer
	, PCount1y		integer
	, Count1yArr	nvarchar(1)
	, AuMW1y		float
	, PAuMW1y		float
	, AuMW1yArr		nvarchar(1)
	, Count2y		integer
	, PCount2y		integer
	, Count2yArr	nvarchar(1)
	, AuMW2y		float
	, PAuMW2y		float
	, AuMW2yArr		nvarchar(1)
	, Count3y		integer
	, PCount3y		integer
	, Count3yArr	nvarchar(1)
	, AuMW3y		float
	, PAuMW3y		float
	, AuMW3yArr		nvarchar(1)
	, Count5y		integer
	, PCount5y		integer
	, Count5yArr	nvarchar(1)
	, AuMW5y		float
	, PAuMW5y		float
	, AuMW5yArr		nvarchar(1)
)

INSERT INTO #PerfStats
EXEC dbo.spS_GetCEOPerfAll @RefDate, @Offshore, @Core


INSERT INTO #PerfStats
EXEC dbo.spS_GetCEOPerfDesk @RefDate, @Offshore, @Core

----------------------------------------------------
SELECT	'Top2QCount_Ch' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(CAST(P.Count1m AS float)/NULLIF(A.QCount1m, 0)) AS [1m]
	, SUM(CAST(P.Count3m AS float)/NULLIF(A.QCount3m, 0)) AS [3m]
	, SUM(CAST(P.CountYtD AS float)/NULLIF(A.QCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.Count1y AS float)/NULLIF(A.QCount1y, 0)) AS [1y]
	, SUM(CAST(P.Count2y AS float)/NULLIF(A.QCount2y, 0)) AS [2y]
	, SUM(CAST(P.Count3y AS float)/NULLIF(A.QCount3y, 0)) AS [3y]
	, SUM(CAST(P.Count5y AS float)/NULLIF(A.QCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('1st Q', '2nd Q')
GROUP BY P.DeskGroup


UNION 
SELECT	'Top2QCount_Ch' AS Item
	, P.DeskGroup
	, 'Previous' AS Legend
	, SUM(CAST(P.PCount1m AS float)/NULLIF(A.PQCount1m, 0)) AS [1m]
	, SUM(CAST(P.PCount3m AS float)/NULLIF(A.PQCount3m, 0)) AS [3m]
	, SUM(CAST(P.PCountYtD AS float)/NULLIF(A.PQCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.PCount1y AS float)/NULLIF(A.PQCount1y, 0)) AS [1y]
	, SUM(CAST(P.PCount2y AS float)/NULLIF(A.PQCount2y, 0)) AS [2y]
	, SUM(CAST(P.PCount3y AS float)/NULLIF(A.PQCount3y, 0)) AS [3y]
	, SUM(CAST(P.PCount5y AS float)/NULLIF(A.PQCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('1st Q', '2nd Q')
GROUP BY P.DeskGroup


UNION
SELECT	P.Qualifier+'Count' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(CAST(P.Count1m AS float)/NULLIF(A.QCount1m, 0)) AS [1m]
	, SUM(CAST(P.Count3m AS float)/NULLIF(A.QCount3m, 0)) AS [3m]
	, SUM(CAST(P.CountYtD AS float)/NULLIF(A.QCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.Count1y AS float)/NULLIF(A.QCount1y, 0)) AS [1y]
	, SUM(CAST(P.Count2y AS float)/NULLIF(A.QCount2y, 0)) AS [2y]
	, SUM(CAST(P.Count3y AS float)/NULLIF(A.QCount3y, 0)) AS [3y]
	, SUM(CAST(P.Count5y AS float)/NULLIF(A.QCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('TopDec', 'BotDec')

GROUP BY P.DeskGroup, P.Qualifier

UNION
SELECT	P.Qualifier+'Count' AS Item
	, P.DeskGroup
	, 'Prev' AS Legend
	, SUM(CAST(P.PCount1m AS float)/NULLIF(A.PQCount1m, 0)) AS [1m]
	, SUM(CAST(P.PCount3m AS float)/NULLIF(A.PQCount3m, 0)) AS [3m]
	, SUM(CAST(P.PCountYtD AS float)/NULLIF(A.PQCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.PCount1y AS float)/NULLIF(A.PQCount1y, 0)) AS [1y]
	, SUM(CAST(P.PCount2y AS float)/NULLIF(A.PQCount2y, 0)) AS [2y]
	, SUM(CAST(P.PCount3y AS float)/NULLIF(A.PQCount3y, 0)) AS [3y]
	, SUM(CAST(P.PCount5y AS float)/NULLIF(A.PQCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('TopDec', 'BotDec')
GROUP BY P.DeskGroup, P.Qualifier

UNION
SELECT	'AheadCount_Ch' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(CAST(P.Count1m AS float)/NULLIF(A.BCount1m, 0)) AS [1m]
	, SUM(CAST(P.Count3m AS float)/NULLIF(A.BCount3m, 0)) AS [3m]
	, SUM(CAST(P.CountYtD AS float)/NULLIF(A.BCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.Count1y AS float)/NULLIF(A.BCount1y, 0)) AS [1y]
	, SUM(CAST(P.Count2y AS float)/NULLIF(A.BCount2y, 0)) AS [2y]
	, SUM(CAST(P.Count3y AS float)/NULLIF(A.BCount3y, 0)) AS [3y]
	, SUM(CAST(P.Count5y AS float)/NULLIF(A.BCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('Fund >= Index')
GROUP BY P.DeskGroup
UNION
SELECT	'AheadCount_Ch' AS Item
	, P.DeskGroup
	, 'Previous' AS Legend
	, SUM(CAST(P.PCount1m AS float)/NULLIF(A.PBCount1m, 0)) AS [1m]
	, SUM(CAST(P.PCount3m AS float)/NULLIF(A.PBCount3m, 0)) AS [3m]
	, SUM(CAST(P.PCountYtD AS float)/NULLIF(A.PBCountYtD, 0)) AS [YtD]
	, SUM(CAST(P.PCount1y AS float)/NULLIF(A.PBCount1y, 0)) AS [1y]
	, SUM(CAST(P.PCount2y AS float)/NULLIF(A.PBCount2y, 0)) AS [2y]
	, SUM(CAST(P.PCount3y AS float)/NULLIF(A.PBCount3y, 0)) AS [3y]
	, SUM(CAST(P.PCount5y AS float)/NULLIF(A.PBCount5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('Fund >= Index')
GROUP BY P.DeskGroup

UNION
SELECT	'Top2QAuMw_Ch' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(P.AuMW1m/NULLIF(A.QAuMW1m, 0)) AS [1m]
	, SUM(P.AuMW3m/NULLIF(A.QAuMW3m, 0)) AS [3m]
	, SUM(P.AuMWYtD/NULLIF(A.QAuMW3m, 0)) AS [YtD]
	, SUM(P.AuMW1y/NULLIF(A.QAuMW1y, 0)) AS [1y]
	, SUM(P.AuMW2y/NULLIF(A.QAuMW2y, 0)) AS [2y]
	, SUM(P.AuMW3y/NULLIF(A.QAuMW3y, 0)) AS [3y]
	, SUM(P.AuMW5y/NULLIF(A.QAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('1st Q', '2nd Q')
GROUP BY P.DeskGroup
UNION
SELECT	'Top2QAuMw_Ch' AS Item
	, P.DeskGroup
	, 'Previous' AS Legend
	, SUM(P.PAuMW1m/NULLIF(A.PQAuMW1m, 0)) AS [1m]
	, SUM(P.PAuMW3m/NULLIF(A.PQAuMW3m, 0)) AS [3m]
	, SUM(P.PAuMWYtD/NULLIF(A.PQAuMW3m, 0)) AS [YtD]
	, SUM(P.PAuMW1y/NULLIF(A.PQAuMW1y, 0)) AS [1y]
	, SUM(P.PAuMW2y/NULLIF(A.PQAuMW2y, 0)) AS [2y]
	, SUM(P.PAuMW3y/NULLIF(A.PQAuMW3y, 0)) AS [3y]
	, SUM(P.PAuMW5y/NULLIF(A.PQAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('1st Q', '2nd Q')
GROUP BY P.DeskGroup

UNION
SELECT	'AheadAuMw_Ch' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(P.AuMW1m/NULLIF(A.BAuMW1m, 0)) AS [1m]
	, SUM(P.AuMW3m/NULLIF(A.BAuMW3m, 0)) AS [3m]
	, SUM(P.AuMWYtD/NULLIF(A.BAuMW3m, 0)) AS [YtD]
	, SUM(P.AuMW1y/NULLIF(A.BAuMW1y, 0)) AS [1y]
	, SUM(P.AuMW2y/NULLIF(A.BAuMW2y, 0)) AS [2y]
	, SUM(P.AuMW3y/NULLIF(A.BAuMW3y, 0)) AS [3y]
	, SUM(P.AuMW5y/NULLIF(A.BAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('Fund >= Index')
GROUP BY P.DeskGroup
UNION
SELECT	'AheadAuMw_Ch' AS Item
	, P.DeskGroup
	, 'Previous' AS Legend
	, SUM(P.PAuMW1m/NULLIF(A.PBAuMW1m, 0)) AS [1m]
	, SUM(P.PAuMW3m/NULLIF(A.PBAuMW3m, 0)) AS [3m]
	, SUM(P.PAuMWYtD/NULLIF(A.PBAuMW3m, 0)) AS [YtD]
	, SUM(P.PAuMW1y/NULLIF(A.PBAuMW1y, 0)) AS [1y]
	, SUM(P.PAuMW2y/NULLIF(A.PBAuMW2y, 0)) AS [2y]
	, SUM(P.PAuMW3y/NULLIF(A.PBAuMW3y, 0)) AS [3y]
	, SUM(P.PAuMW5y/NULLIF(A.PBAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('Fund >= Index')
GROUP BY P.DeskGroup

UNION
SELECT	P.Qualifier+'AuMw' AS Item
	, P.DeskGroup
	, 'Last' AS Legend
	, SUM(P.AuMW1m/NULLIF(A.BAuMW1m, 0)) AS [1m]
	, SUM(P.AuMW3m/NULLIF(A.BAuMW3m, 0)) AS [3m]
	, SUM(P.AuMWYtD/NULLIF(A.BAuMW3m, 0)) AS [YtD]
	, SUM(P.AuMW1y/NULLIF(A.BAuMW1y, 0)) AS [1y]
	, SUM(P.AuMW2y/NULLIF(A.BAuMW2y, 0)) AS [2y]
	, SUM(P.AuMW3y/NULLIF(A.BAuMW3y, 0)) AS [3y]
	, SUM(P.AuMW5y/NULLIF(A.BAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('BotDec', 'TopDec')
GROUP BY P.DeskGroup, P.Qualifier
UNION
SELECT	P.Qualifier+'AuMw' AS Item
	, P.DeskGroup
	, 'Previous' AS Legend
	, SUM(P.PAuMW1m/NULLIF(A.PBAuMW1m, 0)) AS [1m]
	, SUM(P.PAuMW3m/NULLIF(A.PBAuMW3m, 0)) AS [3m]
	, SUM(P.PAuMWYtD/NULLIF(A.PBAuMW3m, 0)) AS [YtD]
	, SUM(P.PAuMW1y/NULLIF(A.PBAuMW1y, 0)) AS [1y]
	, SUM(P.PAuMW2y/NULLIF(A.PBAuMW2y, 0)) AS [2y]
	, SUM(P.PAuMW3y/NULLIF(A.PBAuMW3y, 0)) AS [3y]
	, SUM(P.PAuMW5y/NULLIF(A.PBAuMW5y, 0)) AS [5y]
FROM	#PerfStats AS P LEFT JOIN #AuMStats AS A ON (
		P.DeskGroup = A.DeskGroup
		)
WHERE	A.Objective = 'All'
	AND P.Qualifier IN ('BotDec', 'TopDec')
GROUP BY P.DeskGroup, P.Qualifier


----------------------------------------------------

DROP TABLE #AuMStats
DROP TABLE #PerfStats

----------------------------------------------------

GO
GRANT EXECUTE ON dbo.spS_GetCEOCharts TO [OMAM\Compliance]




