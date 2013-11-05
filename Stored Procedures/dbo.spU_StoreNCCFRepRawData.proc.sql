USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spU_StoreNCCFRepRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spU_StoreNCCFRepRawData
GO

CREATE PROCEDURE dbo.spU_StoreNCCFRepRawData

AS

------------------------------------------------------------------------

SET NOCOUNT ON;

DECLARE @RefDate datetime
DECLARE @SecFileName nvarchar(25)

SET @RefDate = (SELECT [RefDate] FROM tbl_SectorDataStIn GROUP BY [RefDate])
SET @SecFileName = (SELECT [fileName] FROM tbl_SectorDataStIn GROUP BY [fileName])

--== Funds in scope
CREATE TABLE #ScopeFundsDets (
		FundId Integer
		, FundCode nvarchar(20)
		, FundName nvarchar(255)
		, ISIN nvarchar(255)
		, AuMGBP float
		, Classification nvarchar(50)
		, Sector nvarchar(50)
		, FileName nvarchar (25)
)

INSERT INTO #ScopeFundsDets
EXEC dbo.spS_ScopeNCCFRep @RefDate

--SELECT * FROM #ScopeFundsDets
-------------------------------------------------------------------

--== Output for MStar Direct to determine the relevant sector needed and the file names
SELECT	Classification
		, Sector
		, FileName
INTO	#Classific
FROM	#ScopeFundsDets
GROUP BY	Classification
			, Sector
			, FileName
ORDER BY	FileName

--SELECT * FROM #Classific

--== Getting the Competitors list
SELECT	Defs.FundId
		, Defs.CompName
		, Sec.FundName AS MStarName
		, Defs.CompId
		, ISNULL(Defs.CompRefISIN, Defs.CompOldISIN) AS RefISIN
		, Sec.NCCF1m
		, Sec.NCCF3m
		, Sec.Perf1y
		, Sec.Perf3y
		, Sec.StDev1y
		, Sec.StDev3y
		, Sec.RefDate
		, SecDefs.FileName
		, SecDefs.Classification
		, SecDefs.Sector
INTO	#CompList
FROM	tbl_CompDefs AS Defs LEFT JOIN
		#ScopeFundsDets AS SecDefs ON (
			Defs.FundId = SecDefs.FundId
			) LEFT JOIN
		tbl_SectorDataStIn AS Sec ON (
			ISNULL(Defs.CompRefISIN, Defs.CompOldISIN) = Sec.ISIN
			)
WHERE	SecDefs.FileName = @SecFileName
		AND Defs.RefDate = @RefDate

--SELECT * FROM #CompList

--== BEST SELLERs.
-- 1m
SELECT	Sc.FundId
		, MAX(dSet.FundName) AS FundName
		, MAX(dSet.ISIN) AS ISIN
		, AVG(dSet.NCCF1m) AS NCCF1m
		, AVG(dSet.NCCF3m) AS NCCF3m
		, AVG(dSet.Perf1y) AS Perf1y
		, AVG(dSet.Perf3y) AS Perf3y
		, AVG(dSet.StDev1y) AS StDev1y
		, AVG(dSet.StDev3y) AS StDev3y
		, MAX(dSet.[FileName]) AS [FileName]
		, MAX(dSet.RefDate) AS RefDate
INTO	#BS1m
FROM	tbl_SectorDataStIn AS dSet LEFT JOIN
		#ScopeFundsDets AS Sc ON (
			dSet.FileName = Sc.FileName
			)
WHERE	NCCF1m = (SELECT MAX(NCCF1m) FROM tbl_SectorDataStIn)
GROUP BY	Sc.FundId

-- 3m
SELECT	Sc.FundId
		, MAX(dSet.FundName) AS FundName
		, MAX(dSet.ISIN) AS ISIN
		, AVG(dSet.NCCF1m) AS NCCF1m
		, AVG(dSet.NCCF3m) AS NCCF3m
		, AVG(dSet.Perf1y) AS Perf1y
		, AVG(dSet.Perf3y) AS Perf3y
		, AVG(dSet.StDev1y) AS StDev1y
		, AVG(dSet.StDev3y) AS StDev3y
		, MAX(dSet.[FileName]) AS [FileName]
		, MAX(dSet.RefDate) AS RefDate
INTO	#BS3m
FROM	tbl_SectorDataStIn AS dSet LEFT JOIN
		#ScopeFundsDets AS Sc ON (
			dSet.FileName = Sc.FileName
			)
WHERE	NCCF3m = (SELECT MAX(NCCF3m) FROM tbl_SectorDataStIn)
GROUP BY	Sc.FundId

--== OUR FUNDS
SELECT	OMGI.FundId
		, Sec.FundName
		, Sec.ISIN
		, Sec.NCCF1m
		, Sec.NCCF3m
		, Sec.Perf1y
		, Sec.Perf3y
		, Sec.StDev1y
		, Sec.StDev3y
		, Sec.RefDate
		, Sec.FileName
		, C.Classification
		, C.Sector
INTO	#OMGI
FROM	tbl_SectorDataStIn AS Sec JOIN
		#ScopeFundsDets AS OMGI ON (
			OMGI.ISIN = Sec.ISIN
			AND OMGI.FileName = Sec.FileName
			) JOIN
		#Classific AS C ON (
			C.FileName = Sec.FileName
			)

--SELECT * FROM #OMGI

--== Create dataset
SELECT	'OMGI' AS Item
		, FundId
		, 0 AS CompId
		, FundName
		, ISIN
		, NCCF1m
		, NCCF3m
		, Perf1y
		, Perf3y
		, StDev1y
		, StDev3y
		, RefDate
		, FileName
		, Classification
		, Sector
INTO #DataSet
FROM	#OMGI
UNION ALL
SELECT	'Comp'
		, FundId
		, CompId
		, ISNULL(MStarName, CompName)
		, RefISIN
		, NCCF1m
		, NCCF3m
		, Perf1y
		, Perf3y
		, StDev1y
		, StDev3y 
		, @RefDate
		, FileName
		, Classification
		, Sector
FROM	#CompList
WHERE	ISNULL(MStarName, CompName) IS NOT NULL
UNION ALL
SELECT	'BS1m'
		, Bs.FundId
		, 8 
		, Bs.FundName
		, Bs.ISIN
		, Bs.NCCF1m
		, Bs.NCCF3m
		, Bs.Perf1y
		, Bs.Perf3y
		, Bs.StDev1y
		, Bs.StDev3y
		, Bs.RefDate
		, Bs.[FileName]
		, Cl.Classification
		, Cl.Sector

FROM	#BS1m AS Bs LEFT JOIN
		#Classific AS Cl ON (
			Bs.Filename = Cl.FileName
			)
UNION ALL
SELECT	'BS3m'
		, Bs.FundId
		, 8 
		, Bs.FundName
		, Bs.ISIN
		, Bs.NCCF1m
		, Bs.NCCF3m
		, Bs.Perf1y
		, Bs.Perf3y
		, Bs.StDev1y
		, Bs.StDev3y
		, Bs.RefDate
		, Bs.[FileName]
		, Cl.Classification
		, Cl.Sector

FROM	#BS3m AS Bs LEFT JOIN
		#Classific AS Cl ON (
			Bs.Filename = Cl.FileName
			)
--SELECT * FROM #Dataset

------------------------------------------------------
DELETE	tbl
FROM	tbl_NCCFPerf AS tbl JOIN
		#Dataset AS dSet ON (
			tbl.FundId = dSet.FundId
			AND tbl.RefDate = dSet.RefDate
			)

INSERT INTO tbl_NCCFPerf
SELECT * FROM #Dataset

TRUNCATE TABLE tbl_SectorDataStIn

------------------------------------------------------
DROP TABLE #ScopeFundsDets
DROP TABLE #BS1m
DROP TABLE #BS3m
DROP TABLE #Classific
DROP TABLE #CompList
DROP TABLE #OMGI
DROP TABLE #Dataset
----------------------------------------------------------------------------------

GO
GRANT EXECUTE ON dbo.spU_StoreNCCFRepRawData TO [OMAM\Compliance]