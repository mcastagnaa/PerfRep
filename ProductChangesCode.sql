USE PerfRep;

--TO DO

DECLARE @TodayDate datetime
SET @TodayDate = '2013 Nov 8'--datediff(day,0,getdate())
------------------------------------
--== Type 1: Name change ==--
SELECT	* 
INTO	#Changes
FROM	[OMAMPROD01].Vivaldi.dbo.tbl_ProductsChanges
WHERE	ChangeDate = @TodayDate
		AND EventCode = 1

SELECT	FundName
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

UPDATE	tbl_Products
SET		FundName = C.FundNameNew
FROM	#Changes AS C LEFT JOIN 
		tbl_Products AS F ON (
			C.PerfId = F.Id)

SELECT	FundName
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

DROP TABLE #Changes
GO

-----------------------------------
--== Type 2: Merge/CloseOut ==--

DECLARE @TodayDate datetime
SET @TodayDate =  '2013 Nov 8'-- datediff(day,0,getdate())

SELECT	* 
INTO	#Changes
FROM	[OMAMPROD01].Vivaldi.dbo.tbl_ProductsChanges
WHERE	ChangeDate = @TodayDate
		AND EventCode = 2

SELECT	FundName, CloseDate
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

UPDATE	tbl_Products
SET		CloseDate = C.ChangeDate
FROM	#Changes AS C LEFT JOIN 
		tbl_Products AS F ON (
			C.PerfId = F.Id)

SELECT	FundName, CloseDate
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

DROP TABLE #Changes
GO

-----------------------------------
--== Type 3: Change of PM/Team ==--

DECLARE @TodayDate datetime
SET @TodayDate =  '2013 Nov 8'--datediff(day,0,getdate())

SELECT	* 
INTO	#Changes
FROM	[OMAMPROD01].Vivaldi.dbo.tbl_ProductsChanges
WHERE	ChangeDate = @TodayDate
		AND EventCode = 3

SELECT	F.FundName, F.InvManager, F.OurTeam, F.OurPM
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

UPDATE	tbl_Products
SET		LastPMChange = C.ChangeDate
		, InvManager = C.InvManagerNew
		, ExternalPM = NULL
		, OurTeam = C.OurTeamNew
		, OurPM = C.OurPMNew
FROM	#Changes AS C LEFT JOIN 
		tbl_Products AS F ON (
			C.PerfId = F.Id)

SELECT	F.FundName, F.InvManager, F.OurTeam, F.OurPM
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

DROP TABLE #Changes
GO


-----------------------------------
--== Type 4: Change of SoldAStype (umbrella implicitely) ==--

DECLARE @TodayDate datetime
SET @TodayDate =  '2013 Nov 8'--datediff(day,0,getdate())

SELECT	* 
INTO	#Changes
FROM	[OMAMPROD01].Vivaldi.dbo.tbl_ProductsChanges
WHERE	ChangeDate = @TodayDate
		AND EventCode = 4

SELECT	F.FundName, F.SoldAs
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

UPDATE	tbl_Products
SET		SoldAs = C.SoldAsNew
FROM	#Changes AS C LEFT JOIN 
		tbl_Products AS F ON (
			C.PerfId = F.Id)

SELECT	F.FundName, F.SoldAs
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

DROP TABLE #Changes
GO

-----------------------------------
--== Type 5: Change of Benchmark ==--

DECLARE @TodayDate datetime
SET @TodayDate =  '2013 Nov 8'--datediff(day,0,getdate())

SELECT	* 
INTO	#Changes
FROM	[OMAMPROD01].Vivaldi.dbo.tbl_ProductsChanges
WHERE	ChangeDate = @TodayDate
		AND EventCode = 5

SELECT	F.FundName, F.BenchmarkId
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

UPDATE	tbl_Products
SET		BenchmarkId = C.BenchNew
FROM	#Changes AS C LEFT JOIN 
		tbl_Products AS F ON (
			C.PerfId = F.Id)

SELECT	F.FundName, F.BenchmarkId
FROM	tbl_Products AS F RIGHT JOIN 
		#Changes AS C ON (
			C.PerfId = F.Id)

DROP TABLE #Changes
GO
