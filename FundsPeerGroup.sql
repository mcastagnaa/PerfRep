USE PerfRep
GO

DECLARE	@RefDate datetime
SET @RefDate = '2012 Sep 30'

----------------------------------------------------------------------------------

SELECT	Funds.Id AS FundId
	, Funds.ShortCode AS FundCode
	, Funds.Company
	, Funds.OurTeam AS Desk
	, Funds.FundName
	, Funds.AssetClass
	, Peers.CatSelector AS PeersDef
	, (CASE CatSelector
		WHEN 'MStar' THEN MStarCat
		WHEN 'IMA' THEN IMACat
		WHEN 'ABI' THEN ABICat
		WHEN 'GIF' THEN GIFCat
		WHEN 'Custom' THEN CustomCat
	END) AS PeerGroup

FROM	tbl_PeerGroupsDefs AS Peers LEFT JOIN
	tbl_Products AS Funds ON (
		Peers.FundId = Funds.Id
		)

WHERE	(Funds.SoldAs NOT IN('Mandate')
	OR Funds.SoldAs IS NULL)
--	AND Peers.CatSelector IS NOT NULL
	AND  (Funds.InceptionDate < @RefDate)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))
--	AND Peers.FactsetCode is null	

ORDER BY Funds.OurTeam, Funds.AssetClass



