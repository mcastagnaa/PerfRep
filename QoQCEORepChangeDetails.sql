Use PerfRep;
DECLARE @RefDatePer1 datetime
		, @RefDatePer2 datetime

SET @RefDatePer1 = '2013 Sep 30'
SET @RefDatePer2 = '2013 Dec 31'

--------------------------------------------------
SELECT	OurTeam AS Desk
		, FundId
		, FundName
		, PrimaryObj
		, PeerGroup
		, BenchName
		, AuMGBP
		, AuMWeight
		, Quart3y AS Quartile3y
		, BenchRP3ya AS RelPerf3yAnn

INTO #Per2
FROM tbl_EoMPerfSummary
WHERE RefDate = @RefDatePer1

--------------------------------------------------

SELECT	OurTeam AS Desk
		, FundId
		, FundName
		, PeerGroup
		, PrimaryObj
		, BenchName
		, AuMGBP
		, AuMWeight
		, Quart3y AS Quartile3y
		, BenchRP3ya AS RelPerf3yAnn

INTO #Per1
FROM tbl_EoMPerfSummary
WHERE RefDate = @RefDatePer2

--------------------------------------------------

SELECT	ISNULL(P1.FundId, P2.FundId) AS FundId
		, ISNULL(P1.Desk, P2.Desk) AS Desk
		, ISNULL(P1.FundName, P2.FundName) AS FundName
		, ISNULL(P1.PeerGroup, P2.PeerGroup) AS PeerGroup
		, ISNULL(P1.PrimaryObj, P2.PrimaryObj) AS PrimaryObj
		, ISNULL(P1.BenchName, P2.BenchName) AS BenchName
		, P2.Quartile3y AS Quartile3yPer1
		, P1.Quartile3y AS Quartile3yPer2
		, P2.RelPerf3yAnn AS RelPerf3yAnnPer1
		, P1.RelPerf3yAnn AS RelPerf3yAnnPer2
		, P2.AuMGBP AS Per1AuMGBP
		, P1.AuMGBP AS Per2AuMGBP
		, P2.AuMWeight AS Per1AuMWeight
		, P1.AuMWeight AS Per2AuMWeight
FROM	#Per1 AS P1 FULL JOIN
		#Per2 AS P2 ON (
			P1.FundId = P2.FundId
			)

ORDER BY ISNULL(P1.Desk, P2.Desk), ISNULL(P1.FundName, P2.FundName)

-------------------------------------------------
DROP TABLE #Per1
DROP TABLE #Per2