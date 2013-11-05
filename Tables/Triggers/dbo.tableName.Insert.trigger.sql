USE CtpRisk
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (	SELECT * 
		FROM dbo.sysobjects 
		WHERE id = OBJECT_ID(N'dbo.tbl_BoNYRepos$Insert') 
			AND OBJECTPROPERTY(id, N'IsTrigger') = 1)

DROP TRIGGER dbo.tbl_BoNYRepos$Insert
GO

CREATE TRIGGER tbl_BoNYRepos$Insert
   ON dbo.tbl_BoNYRepos AFTER INSERT, UPDATE
AS 

SET NOCOUNT ON

DECLARE @FirstDate datetime
DECLARE @LastDate datetime
DECLARE @AllDates table (RefDate datetime)

SET @LastDate = (SELECT MAX(EndDate) FROM tbl_BoNYRepos)
SET @FirstDate = (SELECT MIN(StartDate) FROM tbl_BoNYRepos)


SELECT TOP( CAST((@LastDate - @FirstDate) AS integer)) IDENTITY(int,1,1) AS Number
INTO 	#tbl_Numbers
FROM 	sys.columns s1 CROSS JOIN 
	sys.columns s2 
ALTER TABLE #tbl_Numbers 
ADD CONSTRAINT PK_Numbers PRIMARY KEY CLUSTERED (Number)


INSERT INTO @AllDates
         (RefDate)
SELECT	@FirstDate + Number - 1
FROM	#tbl_Numbers
WHERE 	Number <= DATEDIFF(day,@FirstDate,@LastDate) + 1


SELECT * 
INTO #tbl_BoNYRepoDates
FROM @AllDates 

-----------------------------------------------------

SELECT * 
INTO	#LatestRepos
FROM 	tbl_BoNYRepos AS AllRepos
WHERE 	AllRepos.RefDate = (
		SELECT MAX(M.RefDate) 
		FROM tbl_BoNYRepos AS M 
		WHERE M.DealId = AllRepos.DealId
		)

-----------------------------------------------------

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'[dbo].[tbl_BoNYRepoAdj]') AND 
		OBJECTPROPERTY(id,N'IsTable') = 1
	)
BEGIN
	DROP TABLE tbl_BoNYRepoAdj
END

-----------------------------------------------------

SELECT	Dts.RefDate
	, Rep.DealID AS RepDealId
	, Rep.RuleSet AS RepFundCode
	, Rep.DealAmount AS LocExposure
	, Rep.Currency AS CCY
	, Rep.RefDate As RepDate
	
INTO	tbl_BoNYRepoAdj
FROM	#tbl_BoNYRepoDates AS Dts
	, #LatestRepos AS Rep
WHERE	Dts.RefDate >= Rep.StartDate
	AND Dts.RefDate < Rep.EndDate

-----------------------------------------------------

DROP TABLE #LatestRepos
DROP TABLE #tbl_Numbers
DROP TABLE #tbl_BoNYRepoDates