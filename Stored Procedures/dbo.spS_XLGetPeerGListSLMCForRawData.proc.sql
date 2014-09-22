USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPeerGListSLMCForRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPeerGListSLMCForRawData
GO

CREATE PROCEDURE dbo.spS_GetPeerGListSLMCForRawData
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
	, Funds.LastPMChange
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
	AND (Funds.LastPMChange IS NOT NULL)
	AND (Funds.InceptionDate < Funds.LastPMChange)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))

	

----------------------------------------------------------------------------------

SELECT	CatSelector
	, PeerGroup
	, BaseCCYIso
	, LastPMChange
	, '"' + FactsetCode + '"'

FROM	#PeersList
WHERE	PeerGroup IS NOT NULL

GROUP BY	CatSelector
		, PeerGroup
		, BaseCCYIso
		, LastPMChange
		, FactsetCode

ORDER BY	CatSelector
		, PeerGroup


----------------------------------------------------------------------------------
DROP TABLE	#PeersList
GO

GRANT EXECUTE ON dbo.spS_GetPeerGListSLMCForRawData TO [OMAM\Compliance]