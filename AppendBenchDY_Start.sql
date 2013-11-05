USE PerfRep
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'

TRUNCATE TABLE tbl_BenchPerfsDY

INSERT INTO tbl_BenchPerfsDY (BenchId, CCY, Year, BenchPerf, BenchSD)
	(
	SELECT 	BchkId
		, CCY
		, 2011
		, [Beny-1]
		, [BenStDy-1]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate

	UNION 
	SELECT 	BchkId
		, CCY
		, 2010
		, [Beny-2]
		, [BenStDy-2]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate

	UNION 
	SELECT 	BchkId
		, CCY
		, 2009
		, [Beny-3]
		, [BenStDy-3]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate
	
	UNION 
	SELECT 	BchkId
		, CCY
		, 2008
		, [Beny-4]
		, [BenStDy-4]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate

	UNION 
	SELECT 	BchkId
		, CCY
		, 2007
		, [Beny-5]
		, [BenStDy-5]
	FROM	tbl_BenchPerfs
	WHERE	RefDate = @RefDate


	)

UPDATE tbl_BenchPerfsDY
SET RefDate = CAST(CAST(Year AS NVARCHAR(4)) + '/12/31' AS datetime) 