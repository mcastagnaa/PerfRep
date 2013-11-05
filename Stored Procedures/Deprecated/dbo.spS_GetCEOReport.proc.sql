USE PErfRep
GO

DECLARE @RefDate AS datetime
SET @RefDate = '2012 Dec 31'

CREATE TABLE #AuMStats (
	Item 			nvarchar(50)
	, DeskGroup		nvarchar(50)
	, Objective		nvarchar(50)
	, Qualifier		nvarchar(50)
	, Number		integer
	, TotalAuM		float
	, TotalAuMW		float
	, Quart1mCount		integer
	, Quart1mAuM		float	
	, Quart1mAuMW		float
	, Quart3mCount		integer
	, Quart3mAuM		float
	, Quart3mAuMW		float
	, Quart1yCount		integer
	, Quart1yAuM		float
	, Quart1yAuMW		float
	, Quart2yCount		integer
	, Quart2yAuM		float
	, Quart2yAuMW		float
	, Quart3yCount		integer
	, Quart3yAuM		float
	, Quart3yAuMW		float
	, Quart5yCount		integer
	, Quart5yAuM		float
	, Quart5yAuMW		float
	, Ben1mCount		integer
	, Ben1mAuM		float
	, Ben1mAuMW		float
	, Ben3mCount		integer
	, Ben3mAuM		float
	, Ben3mAuMW		float
	, Ben1yCount		integer
	, Ben1yAuM		float
	, Ben1yAuMW		float
	, Ben2yCount		integer
	, Ben2yAuM		float
	, Ben2yAuMW		float
	, Ben3yCount		integer
	, Ben3yAuM		float
	, Ben3yAuMW		float
	, Ben5yCount		integer
	, Ben5yAuM		float
	, Ben5yAuMW		float
	, PNumber		integer
	, PTotalAuM		float
	, PTotalAuMW		float
	, PQuart1mCount		integer
	, PQuart1mAuM		float
	, PQuart1mAuMW		float
	, PQuart3mCount		integer
	, PQuart3mAuM		float
	, PQuart3mAuMW		float
	, PQuart1yCount		integer
	, PQuart1yAuM		float
	, PQuart1yAuMW		float
	, PQuart2yCount		integer
	, PQuart2yAuM		float
	, PQuart2yAuMW		float
	, PQuart3yCount		integer
	, PQuart3yAuM		float
	, PQuart3yAuMW		float
	, PQuart5yCount		integer
	, PQuart5yAuM		float
	, PQuart5yAuMW		float
	, PBen1mCount		integer
	, PBen1mAuM		float
	, PBen1mAuMW		float
	, PBen3mCount		integer
	, PBen3mAuM		float
	, PBen3mAuMW		float
	, PBen1yCount		integer
	, PBen1yAuM		float
	, PBen1yAuMW		float
	, PBen2yCount		integer
	, PBen2yAuM		float
	, PBen2yAuMW		float
	, PBen3yCount		integer
	, PBen3yAuM		float
	, PBen3yAuMW		float
	, PBen5yCount		integer
	, PBen5yAuM		float
	, PBen5yAuMW		float
)

-----------------------------------------------------------

INSERT INTO #AuMStats
EXEC dbo.spS_GetCEOAuMOverall @RefDate

SELECT * FROM #AuMStats

DROP TABLE #AuMStats