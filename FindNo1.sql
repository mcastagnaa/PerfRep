USE PerfREp
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'


SELECT	Id
	, Company
	, FundName
	, RefDate
	, OurTeam
	, InvManager
	, OurPM
	, ProdRank1m
	, ProdRank3m
	, ProdRank6m
	, ProdRankYtD
	, ProdRank1y
	, ProdRank2y
	, ProdRank3y
	, ProdRank5y
	, (	ProdRank1m
		+ ProdRank3m
		+ ProdRank6m
		+ ProdRank1y
		+ ProdRankYtD
		+ ProdRank2y
		+ ProdRank3y
		+ ProdRank5y) AS Stats

FROM	vw_AllPerfDataset

WHERE	RefDate = @RefDate
	AND (
		ProdRank1m = 1
		OR ProdRank3m = 1
		OR ProdRank6m = 1
		OR ProdRankYtD = 1
		OR ProdRank1y = 1
		OR ProdRank2y = 1
		OR ProdRank3y = 1
		OR ProdRank5y = 1
	)
ORDER BY Stats
	