USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPeerGListForRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPeerGListForRawData
GO

CREATE PROCEDURE dbo.spS_GetPeerGListForRawData
	@RefDate datetime

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Peers.CatSelector
	, (CASE CatSelector
		WHEN 'MStar' THEN MStarCat
		WHEN 'IMA' THEN IMACat
		WHEN 'ABI' THEN ABICat
		WHEN 'GIF' THEN GIFCat
		WHEN 'Custom' THEN CustomCat
	END) AS PeerGroup
--	, Peers.FundId
	, Funds.BaseCCYiso
	, Peers.FactsetCode

INTO	#PeersList

FROM	tbl_PeerGroupsDefs AS Peers LEFT JOIN
	tbl_Products AS Funds ON (
		Peers.FundId = Funds.Id
		)

WHERE	(Funds.SoldAs NOT IN('HF', 'Mandate')
	OR Funds.SoldAs IS NULL)
	AND Peers.CatSelector IS NOT NULL
	AND (Funds.InceptionDate < @RefDate)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))
--	AND Peers.FactsetCode is null	

----------------------------------------------------------------------------------

SELECT	CatSelector
	, PeerGroup
	, BaseCCYIso
	, '"' + FactsetCode + '"'

FROM	#PeersList
WHERE	PeerGroup IS NOT NULL

GROUP BY	CatSelector
		, PeerGroup
		, BaseCCYIso
		, FactsetCode

ORDER BY	CatSelector
		, PeerGroup


----------------------------------------------------------------------------------
DROP TABLE	#PeersList
GO

GRANT EXECUTE ON dbo.spS_GetPeerGListForRawData TO [OMAM\Compliance]