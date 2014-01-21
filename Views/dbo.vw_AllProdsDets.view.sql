USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_AllProdsDets]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW [vw_AllProdsDets]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [vw_AllProdsDets]
AS 

-------------------
/* TO DO

*/
-------------------

SELECT	P.Id
		, P.PublicId
		, P.ShortCode
		, P.FundName
		, P.InvManager
		, P.MStarCode
		, P.MStarSPID
		, P.BaseCCYiso
		, P.ExternalPM
		, P.Company
		, P.IsMultiManager
		, P.IsFoF
		, P.HasOverlay
		, P.InAs
		, P.SoldAs
		, P.IsUT
		, P.PrimaryObj
		, P.BenchmarkId
		, P.Strategy
		, P.Style
		, P.AssetClass
		, P.SubAssetClass
		, P.SizeBias
		, P.GeoFocus
		, P.OurPM
		, P.OurTeam
		, P.OurAnalyst
		, P.TPA
		, P.InceptionDate
		, P.CloseDate
		, P.BonusPool
		, P.CitiCode
		, P.RefShClass
		, P.LastPMChange
		, P.SRRIcat
		, P.FinanceName
		, P.SelectRefISIN
		, P.SelectRefMstar
		, P.IsSelect
		, P.IsSelectFull
		, P.IsCore
		, P.RiskLimitName
		, P.RiskLimitValue
		, B.Id AS BenchId
		, B.Code AS BenchCode
		, B.LongName AS BenchLN
		, B.Source
		, B.IsHedged
		, B.HaveConstituents
		, B.IsTR
		, B.FactsetCode AS BenchFcstCode
		, B.WhatConstituents
		, B.IsCustom
		, B.Composition
		, B.Note
		, B.IsCash
		, S.FundId AS SectFundId
		, S.FundName AS SectFundName
		, S.MStarCat
		, S.GIFCat
		, S.IMACat
		, S.ABICat
		, S.CustomCat
		, S.CatSelector
		, S.FactsetCode AS SectFcstCode
		, S.FctsCodeIR
		, S.FileName
		, S.CatSelector + ' - ' + 
			(CASE S.CatSelector 
				WHEN 'MStar' THEN S.MstarCat
				WHEN 'IMA' THEN S.IMACat
				WHEN 'GIF' THEN S.GIFCat
				WHEN 'ABI' THEN S.ABICat
				WHEN 'Custom' THEN S.CustomCat
				ELSE Null END) AS SectorLong
				
FROM	tbl_products AS P LEFT JOIN
		tbl_benchmarks AS B ON (P.benchmarkId = B.Id) LEFT JOIN
		tbl_PeerGroupsDefs AS S ON (P.Id = S.FundId)