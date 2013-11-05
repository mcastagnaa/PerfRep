USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_AllPeersDefs]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_AllPeersDefs]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_AllPeersDefs]
AS 


SELECT	P.Id As FundId
		, P.FundName
		, P.BaseCCYIso AS CCY
		, Pe.CatSelector AS Classification
		, (CASE Pe.CatSelector
			WHEN 'MStar' THEN Pe.MStarCat
			WHEN 'IMA' THEN Pe.IMACat
			WHEN 'ABI' THEN Pe.ABICat
			WHEN 'GIF' THEN Pe.GIFCat
			WHEN 'Custom' THEN Pe.CustomCat
			END) AS Sector
		, Pe.FactsetCode
		, Pe.FctsCodeIR
		, Pe.CatSelector + 
			(CASE Pe.CatSelector
				WHEN 'MStar' THEN Pe.MStarCat
				WHEN 'IMA' THEN Pe.IMACat
				WHEN 'ABI' THEN Pe.ABICat
				WHEN 'GIF' THEN Pe.GIFCat
				WHEN 'Custom' THEN Pe.CustomCat
			END) AS SectorLabel
		, Pe.FctsCodeIR AS IsrlRatioSector
		, Pe.FileName

FROM	tbl_Products AS P LEFT JOIN
		tbl_PeerGroupsDefs AS Pe ON (
			P.Id = Pe.FundId
		)