USE PerfRep
GO

SELECT	Funds.Company + ' - '+ Funds.FundName
	, Peers.CatSelector
	, (CASE CatSelector
		WHEN 'MStar' THEN MStarCat
		WHEN 'IMA' THEN IMACat
		WHEN 'ABI' THEN ABICat
		WHEN 'GIF' THEN GIFCat
		WHEN 'Custom' THEN CustomCat
	END) AS PeerGroup
--	, Funds.SRRIcat
--	, Peers.FundId
	, Funds.BaseCCYiso
	, Bchmk.LongName AS Benchmark
	, SRRI.LongName AS SRRICat


FROM	tbl_Products AS Funds LEFT JOIN
	tbl_PeerGroupsDefs AS Peers ON (
		Peers.FundId = Funds.Id
		) LEFT JOIN 
	tbl_Benchmarks AS Bchmk ON (
		Bchmk.Id = Funds.BenchmarkId
		) LEFT JOIN
	[OMAM\Matteoc].tbl_SRRIcategories AS SRRI ON (
		Funds.SRRICat = SRRI.ID
		)
		

WHERE	Funds.SRRIcat IN (3, 4)

ORDER BY Funds.SRRIcat

