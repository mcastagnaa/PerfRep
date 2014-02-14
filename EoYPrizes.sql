USE PerfRep;

--Best 3y

SELECT TOP 5 CAST(ShortCode + ' - ' + FundName AS VARCHAR(75)) AS Winner
				, CAST(
					CAST(
						CAST(ProdRank3y as decimal(12,2))/PeersNo3y*100 
						AS Decimal(4,2)) 
					AS VARCHAR(12)) + '%' AS Percentile
				, ProdRank3y as Ranking3y
				, PeersNo3y AS PeersNumber3y
FROM	vw_AllPerfDataset
WHERE	PrimaryObj IN ('Peer', 'IsraelsenVsPeers')
		AND RefDate = '2013 Dec 31'
		AND prodRank3y is not null
		AND peersno3y is not null
ORDER BY CAST(ProdRank3y AS float)/PeersNo3y

-----------------

SELECT TOP 5 CAST(ShortCode + ' - ' + FundName AS VARCHAR(75)) AS Winner
				, CAST(
					CAST(
						(NP3y_a - ben3y_a)
						AS Decimal(4,2)) 
					AS VARCHAR(12)) + '%' AS RelPerfAnn
				, CAST(NP3y_a AS DECIMAL(4,2)) as Netperf3yAnn
				, CAST(Ben3y_a AS DECIMAL(4,2)) AS Bench3yAnn
FROM	vw_AllPerfDataset
WHERE	PrimaryObj = 'Index'
		AND RefDate = '2013 Dec 31'
ORDER BY (NP3y_a - ben3y_a) DESC


-- Best 1y

SELECT TOP 5 CAST(ShortCode + ' - ' + FundName AS VARCHAR(75)) AS Winner
				, CAST(
					CAST(
						CAST(ProdRank1y as decimal(12,2))/PeersNo1y*100 
						AS Decimal(4,2)) 
					AS VARCHAR(12)) + '%' AS Percentile
				, ProdRank1y as Ranking1y
				, PeersNo1y AS PeersNumber1y
FROM	vw_AllPerfDataset
WHERE	PrimaryObj  IN ('Peer', 'IsraelsenVsPeers')
		AND RefDate = '2013 Dec 31'
		AND prodRank1y is not null
		AND peersno1y is not null
ORDER BY CAST(ProdRank1y AS float)/PeersNo1y

-----------------

SELECT TOP 5 CAST(ShortCode + ' - ' + FundName AS VARCHAR(75)) AS Winner
				, CAST(
					CAST(
						(NP1y - ben1y)
						AS Decimal(4,2)) 
					AS VARCHAR(12)) + '%' AS RelPerfAnn
				, CAST(NP1y AS DECIMAL(4,2)) as Netperf1y
				, CAST(Ben1y AS DECIMAL(4,2)) AS Bench1y
FROM	vw_AllPerfDataset
WHERE	PrimaryObj = 'Index'
		AND RefDate = '2013 Dec 31'
ORDER BY (NP1y - ben1y) DESC

-----------------

SELECT TOP 5 CAST(ShortCode + ' - ' + FundName AS VARCHAR(75)) AS Winner
				, CAST(
					CAST(
						(NP1y/ProdStD1y)
						AS Decimal(4,2)) 
					AS VARCHAR(12)) AS RawSharpe1y
				, CAST(NP1y AS DECIMAL(4,2)) as Netperf1y
				, CAST(ProdStD1y AS DECIMAL(4,2)) AS StDev1y
FROM	vw_AllPerfDataset
WHERE	RefDate = '2013 Dec 31'
ORDER BY (NP1y/ProdStD1y) DESC

