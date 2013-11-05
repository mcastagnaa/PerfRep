USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetTCFObj') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetTCFObj
GO

CREATE PROCEDURE dbo.spS_GetTCFObj
	@RefDate datetime

AS

SET NOCOUNT ON;
	

DECLARE @PrevDate datetime
SET @PrevDate = (SELECT MAX(RefDate) FROM tbl_TCFPeer WHERE RefDate < @RefDate)

------------------------------------------------------------------
EXEC	dbo.spS_GetTCFBenchTest @RefDate
EXEC	dbo.spS_GetTCFPeerTest @RefDate

SELECT	P.Id AS FundId
		, P.ShortCode AS FundCode
		, P.FundName
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.FundAndIndex
			ELSE TcfBen.FundAndIndex END) As FundLongLabel
		, P.PrimaryObj
		, P.Company
		, P.InvManager
		, D.LongName AS OurTeam
		, P.OurPM
		, P.SoldAs AS Vehicle
		, @RefDate AS RefDate
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label1y
			ELSE TcfBen.Label1y END) As Label1y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test1y
			ELSE TcfBen.Test1y END) As Test1y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label3y
			ELSE TcfBen.Label3y END) As Label3y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test3y
			ELSE TcfBen.Test3y END) As Test3y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label5y
			ELSE TcfBen.Label5y END) As Label5y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test5y
			ELSE TcfBen.Test5y END) As Test5y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.BlendRAG
			ELSE TcfBen.BlendRAG END) As BlendRAG

INTO	#LastTest

FROM	tbl_Products AS P LEFT JOIN
		tbl_TCFBench AS TcfBen ON (
			P.Id = TcfBen.FundId
			AND TcfBen.RefDate = @RefDate
			) LEFT JOIN
		tbl_TCFPeer AS TcfPeer ON (
			P.Id = TcfPeer.FundId
			AND TcfPeer.RefDate = @RefDate
			) LEFT JOIN
		tbl_Desks AS D ON (
			P.OurTeam = D.Code
			)

WHERE	P.SoldAs NOT IN('Mandate', 'HF')
		AND ISNULL(P.CloseDate, GETDATE()) > @RefDate
		AND P.InceptionDate < DATEADD(mm, -12, @RefDate)
---
SELECT	SUM(Test1y) AS Test1y
		, COUNT(Test1y) AS Count1y
		, ROUND(Count(Test1y)*2 + Count(Test1y)/4, 0) AS HiThreshold1y
		, ROUND(Count(Test1y)*2 - Count(Test1y)/4, 0) AS LoThreshold1y
		, SUM(CASE WHEN Test1y > 1 THEN 1 ELSE 0 END) AS ARCount1y
		, CAST(SUM(CASE WHEN Test1y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test1y) AS ARPerc1y

		, SUM(Test3y) AS Test3y
		, COUNT(Test3y) AS Count3y
		, ROUND(Count(Test3y)*2 + Count(Test3y)/4, 0) AS HiThreshold3y
		, ROUND(Count(Test3y)*2 - Count(Test3y)/4, 0) AS LoThreshold3y
		, SUM(CASE WHEN Test3y > 1 THEN 1 ELSE 0 END) AS ARCount3y
		, CAST(SUM(CASE WHEN Test3y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test3y) AS ARPerc3y

		, SUM(Test5y) AS Test5y
		, COUNT(Test5y) AS Count5y
		, ROUND(Count(Test5y)*2 + Count(Test5y)/4, 0) AS HiThreshold5y
		, ROUND(Count(Test5y)*2 - Count(Test5y)/4, 0) AS LoThreshold5y
		, SUM(CASE WHEN Test5y > 1 THEN 1 ELSE 0 END) AS ARCount5y
		, CAST(SUM(CASE WHEN Test5y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test5y) AS ARPerc5y

		, SUM(BlendRAG) AS BlendRAG
		, COUNT(BlendRAG) AS CountBlend
		, ROUND(Count(BlendRAG)*2 + Count(BlendRAG)/4, 0) AS HiThresholdBlend
		, ROUND(Count(BlendRAG)*2 - Count(BlendRAG)/4, 0) AS LoThresholdBlend
		, SUM(CASE WHEN BlendRAG > 1 THEN 1 ELSE 0 END) AS ARCountBlend
		, CAST(SUM(CASE WHEN BlendRAG > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(BlendRAG) AS ARPercBlend

INTO	#LastRAG

FROM	#LastTest

------------------------------------------------------------------
		
SELECT	P.Id AS FundId
		, @PrevDate AS RefDate
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label1y
			ELSE TcfBen.Label1y END) As Label1y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test1y
			ELSE TcfBen.Test1y END) As Test1y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label3y
			ELSE TcfBen.Label3y END) As Label3y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test3y
			ELSE TcfBen.Test3y END) As Test3y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Label5y
			ELSE TcfBen.Label5y END) As Label5y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.Test5y
			ELSE TcfBen.Test5y END) As Test5y
		, (CASE P.PrimaryObj
			WHEN 'Peer' THEN TcfPeer.BlendRAG
			ELSE TcfBen.BlendRAG END) As BlendRAG

INTO	#PrevTest

FROM	tbl_Products AS P LEFT JOIN
		tbl_TCFBench AS TcfBen ON (
			P.Id = TcfBen.FundId
			AND TcfBen.RefDate = @PrevDate
			) LEFT JOIN
		tbl_TCFPeer AS TcfPeer ON (
			P.Id = TcfPeer.FundId
			AND TcfPeer.RefDate = @PrevDate
			)

WHERE	P.SoldAs NOT IN('Mandate', 'HF')
		AND ISNULL(P.CloseDate, GETDATE()) > @PrevDate
		AND P.InceptionDate < DATEADD(mm, -12, @PrevDate)

---

SELECT	SUM(Test1y) AS Test1y
		, COUNT(Test1y) AS Count1y
		, ROUND(Count(Test1y)*2 + Count(Test1y)/4, 0) AS HiThreshold1y
		, ROUND(Count(Test1y)*2 - Count(Test1y)/4, 0) AS LoThreshold1y
		, SUM(CASE WHEN Test1y > 1 THEN 1 ELSE 0 END) AS ARCount1y
		, CAST(SUM(CASE WHEN Test1y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test1y) AS ARPerc1y

		, SUM(Test3y) AS Test3y
		, COUNT(Test3y) AS Count3y
		, ROUND(Count(Test3y)*2 + Count(Test3y)/4, 0) AS HiThreshold3y
		, ROUND(Count(Test3y)*2 - Count(Test3y)/4, 0) AS LoThreshold3y
		, SUM(CASE WHEN Test3y > 1 THEN 1 ELSE 0 END) AS ARCount3y
		, CAST(SUM(CASE WHEN Test3y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test3y) AS ARPerc3y

		, SUM(Test5y) AS Test5y
		, COUNT(Test5y) AS Count5y
		, ROUND(Count(Test5y)*2 + Count(Test5y)/4, 0) AS HiThreshold5y
		, ROUND(Count(Test5y)*2 - Count(Test5y)/4, 0) AS LoThreshold5y
		, SUM(CASE WHEN Test5y > 1 THEN 1 ELSE 0 END) AS ARCount5y
		, CAST(SUM(CASE WHEN Test5y > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(Test5y) AS ARPerc5y

		, SUM(BlendRAG) AS BlendRAG
		, COUNT(BlendRAG) AS CountBlend
		, ROUND(Count(BlendRAG)*2 + Count(BlendRAG)/4, 0) AS HiThresholdBlend
		, ROUND(Count(BlendRAG)*2 - Count(BlendRAG)/4, 0) AS LoThresholdBlend
		, SUM(CASE WHEN BlendRAG > 1 THEN 1 ELSE 0 END) AS ARCountBlend
		, CAST(SUM(CASE WHEN BlendRAG > 1 THEN 1 ELSE 0 END) AS FLOAT)/COUNT(BlendRAG) AS ARPercBlend

INTO	#PrevRAG

FROM	#PrevTest

------------------------------------------------------------------

SELECT	'FundDetail' AS Item
		, L.FundId
		, L.FundCode
		, L.FundName
		, L.FundLongLabel
		, L.PrimaryObj
		, L.InvManager
		, L.OurTeam
		, L.OurPM
		, L.Vehicle
		, L.RefDate AS LastDate
		, P.RefDate AS PrevDate
		, L.Label1y
		, L.Test1y
		, P.Test1y AS Prev1y
		, L.Label3y
		, L.Test3y
		, P.Test3y AS Prev3y
		, L.Label5y
		, L.Test5y
		, P.Test5y AS Prev5y
		, NULL AS BlendLabel
		, L.BlendRAG
		, P.BlendRAG AS PrevBlendRAG

FROM #LastTest AS L LEFT JOIN
	#PrevTest AS P ON (L.FundId = P.FundId)

UNION 
SELECT 'RAG' AS Item
		, NULL AS FundId
		, NULL AS FundCode
		, NULL AS FundName
		, NULL AS FundLongLabel
		, NULL AS PrimaryObj
		, NULL AS InvManager
		, NULL AS OurTeam
		, NULL AS OurPM
		, NULL AS Vehicle
		, @RefDate AS LastDate
		, @PrevDate AS PrevDate
		, CONVERT(VARCHAR, L.Test1y) + ' [' +
			CONVERT(VARCHAR, L.LoThreshold1y) + ', ' + 
			CONVERT(VARCHAR, L.HiThreshold1y) + '] - ' + 
			CONVERT(VARCHAR, ROUND(L.ARPerc1y * 100, 2)) + 
			'% A or R out of ' +
			CONVERT(VARCHAR, L.Count1y) AS Label1y
		, (CASE WHEN L.Test1y < L.LoThreshold1y THEN 1
				WHEN L.Test1y > L.HiThreshold1y THEN 3 ELSE 2 END) AS Test1y
		, (CASE WHEN P.Test1y < P.LoThreshold1y THEN 1
				WHEN P.Test1y > P.HiThreshold1y THEN 3 ELSE 2 END) AS Prev1y

		, CONVERT(VARCHAR, L.Test3y) + ' [' +
			CONVERT(VARCHAR, L.LoThreshold3y) + ', ' + 
			CONVERT(VARCHAR, L.HiThreshold3y) + '] - ' + 
			CONVERT(VARCHAR, ROUND(L.ARPerc3y * 100, 2)) + 
			'% A or R out of ' +
			CONVERT(VARCHAR, L.Count3y) AS Label3y
		, (CASE WHEN L.Test3y < L.LoThreshold3y THEN 1
				WHEN L.Test3y > L.HiThreshold3y THEN 3 ELSE 2 END) AS Test3y
		, (CASE WHEN P.Test3y < P.LoThreshold3y THEN 1
				WHEN P.Test3y > P.HiThreshold3y THEN 3 ELSE 2 END) AS Prev3y

		, CONVERT(VARCHAR, L.Test5y) + ' [' +
			CONVERT(VARCHAR, L.LoThreshold5y) + ', ' + 
			CONVERT(VARCHAR, L.HiThreshold5y) + '] - ' + 
			CONVERT(VARCHAR, ROUND(L.ARPerc5y * 100, 2)) + 
			'% A or R out of ' +
			CONVERT(VARCHAR, L.Count5y) AS Label5y
		, (CASE WHEN L.Test5y < L.LoThreshold5y THEN 1
				WHEN L.Test5y > L.HiThreshold5y THEN 3 ELSE 2 END) AS Test5y
		, (CASE WHEN P.Test5y < P.LoThreshold5y THEN 1
				WHEN P.Test5y > P.HiThreshold5y THEN 3 ELSE 2 END) AS Prev5y

		, CONVERT(VARCHAR, L.BlendRAG) + ' [' +
			CONVERT(VARCHAR, L.LoThresholdBlend) + ', ' + 
			CONVERT(VARCHAR, L.HiThresholdBlend) + '] - ' + 
			CONVERT(VARCHAR, ROUND(L.ARPercBlend * 100, 2)) + 
			'% A or R out of ' +
			CONVERT(VARCHAR, L.CountBlend) AS LabelBlend
		, (CASE WHEN L.BlendRAG < L.LoThresholdBlend THEN 1
				WHEN L.BlendRAG > L.HiThresholdBlend THEN 3 ELSE 2 END) AS TestBlend
		, (CASE WHEN P.BlendRAG < P.LoThresholdBlend THEN 1
				WHEN P.BlendRAG > P.HiThresholdBlend THEN 3 ELSE 2 END) AS PrevBlend

FROM #LastRAG AS L, #PrevRAG AS P

------------------------------------------------------------------

--SELECT * FROM #LastTest
--SELECT * FROM #PrevTest
--SELECT * FROM #LastRAG
--SELECT * FROM #PrevRAG

DROP TABLE #LastTest
DROP TABLE #PrevTest
DROP TABLE #LastRAG
DROP TABLE #PrevRAG

GO 
--------------------------------------------
GRANT EXECUTE ON spS_GetTCFObj TO [OMAM\Compliance]
