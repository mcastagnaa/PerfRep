USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetShortPerfRep') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetShortPerfRep
GO

CREATE PROCEDURE dbo.spS_GetShortPerfRep
	@RefDate datetime
	, @SoldAS nvarchar(10)
	, @Select bit
	, @Core bit
AS
/*
NOTE: the SoldAs is defaulted to 'null' for the Access query (i.e. all type of retail funds are listed)
if you want only a subset you need to edit the SQL query in the Access query by removing
'null' and placing there what you want.
Which is going to be useless unless you want the offshore funds: in that case use 'UCITS4'
@Select = 1 then only Select products (@SoldAs = null)
*/

SET NOCOUNT ON;

DECLARE @PrevDate datetime
SET @PrevDate = (SELECT MAX(RefDate) FROM tbl_FundsPerfs WHERE RefDate < @RefDate)

SELECT	V.Id
		, V.FundName
		, V.ShortCode
		, P.PublicId As ISIN
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 'Mixed investment' 
			ELSE V.Classification END) AS Classification
		, V.Classification AS PeerGroupSelector
		, V.InvManager
		, V.LastPmChange
		, V.Inception
        , V.PrimaryObj
		, V.PeerGroup
        , V.BenName
		, P.ExternalPM
		, V.BaseCCYIso
		, D.LongName AS OurTeam
		, V.OurPM
		, P.OurTeam AS PTblTeam
		, P.Strategy
		, P.AssetClass
		, P.SubAssetClass
		, P.Style
		, P.SizeBias
		, P.GeoFocus
		, V.IsSelect
		, V.SoldAS AS ProductType
		, V.NP1m
		, V.NP3m
		, V.NP1y
		, V.NP3y_a

		, (V.NP1m - V.Ben1m) AS RelPerf1m
		, (V.NP3m - V.Ben3m) AS RelPerf3m
		, (V.NP6m - V.Ben6m) AS RelPerf6m
        , (V.NP1y - V.Ben1y) AS RelPerf1y
		, (V.NP3y_a - V.Ben3y_a) AS RelPerf3y

		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1m/CAST(V.PGIRNum1m as float)
				ELSE V.ProdRank1m/CAST(V.PeersNo1m as float) END), 1) AS Quartile1m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3m/CAST(V.PGIRNum3m as float)
				ELSE V.ProdRank3m/CAST(V.PeersNo3m as float) END), 1) AS Quartile3m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank6m/CAST(V.PGIRNum6m as float)
				ELSE V.ProdRank6m/CAST(V.PeersNo6m as float) END), 1) AS Quartile6m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1y/CAST(V.PGIRNum1y as float)
				ELSE V.ProdRank1y/CAST(V.PeersNo1y as float) END), 1) AS Quartile1y
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3y/CAST(V.PGIRNum3y as float)
				ELSE V.ProdRank3y/CAST(V.PeersNo3y as float) END), 1) AS Quartile3y

		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1m/CAST(V.PGIRNum1m as float)
				ELSE V.ProdRank1m/CAST(V.PeersNo1m as float) END) AS Percentile1m
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3m/CAST(V.PGIRNum3m as float)
				ELSE V.ProdRank3m/CAST(V.PeersNo3m as float) END) AS Percentile3m
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1y/CAST(V.PGIRNum1y as float)
				ELSE V.ProdRank1y/CAST(V.PeersNo1y as float) END) AS Percentile1y
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3y/CAST(V.PGIRNum3y as float)
				ELSE V.ProdRank3y/CAST(V.PeersNo3y as float) END) AS Percentile3y

		, ROUND(F.AuMGBP/1000000,0) AS AuM
		, V.AuM AS MStarAuM

INTO	#LAST
FROM	vw_AllPerfDataset AS V LEFT JOIN 
		tbl_Products AS P ON (
			V.id = P.id
			) LEFT JOIN
		tbl_FinanceAuM AS F ON (
			F.ShortCode = P.ShortCode
			--AND F.Company = P.Company
			AND V.RefDate = F.RefDate
			) LEFT JOIN
		tbl_Desks AS D ON (
			V.OurTeam = D.Code
			)
		
WHERE	V.RefDate = @RefDate
		AND (V.CloseDate > @RefDate OR V.CloseDate IS NULL)
		AND DATEDIFF(mm,V.Inception,@RefDate) >= 1
		AND	(V.SoldAs = @SoldAs OR @SoldAs IS NULL)
		AND (V.IsSelect = @Select OR @Select IS NULL)
		AND (P.IsCore = @Core OR @Core IS NULL)
		AND (P.SoldAs NOT IN ('LifePension', 'Mandate'))

--SELECT * FROM #LAST

SELECT	V.Id
		, (V.NP1m - V.Ben1m) AS RelPerf1m
		, (V.NP3m - V.Ben3m) AS RelPerf3m
		, (V.NP6m - V.Ben6m) AS RelPerf6m
        , (V.NP1y - V.Ben1y) AS RelPerf1y
		, (V.NP3y_a - V.Ben3y_a) AS RelPerf3y
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1m/CAST(V.PGIRNum1m as float)
				ELSE V.ProdRank1m/CAST(V.PeersNo1m as float) END), 1) AS Quartile1m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3m/CAST(V.PGIRNum3m as float)
				ELSE V.ProdRank3m/CAST(V.PeersNo3m as float) END), 1) AS Quartile3m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank6m/CAST(V.PGIRNum6m as float)
				ELSE V.ProdRank6m/CAST(V.PeersNo6m as float) END), 1) AS Quartile6m
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1y/CAST(V.PGIRNum1y as float)
				ELSE V.ProdRank1y/CAST(V.PeersNo1y as float) END), 1) AS Quartile1y
		, dbo.fn_GetQuartile((CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3y/CAST(V.PGIRNum3y as float)
				ELSE V.ProdRank3y/CAST(V.PeersNo3y as float) END), 1) AS Quartile3y
		, ROUND(F.AuMGBP/1000000,0) AS AuM
		, V.AuM AS MStarAuM
		, V.NP1m 
		, V.NP3m 
		, V.NP1y 
		, V.NP3y_a 
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1m/CAST(V.PGIRNum1m as float)
				ELSE V.ProdRank1m/CAST(V.PeersNo1m as float) END) AS Percentile1m
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3m/CAST(V.PGIRNum3m as float)
				ELSE V.ProdRank3m/CAST(V.PeersNo3m as float) END) AS Percentile3m
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank1y/CAST(V.PGIRNum1y as float)
				ELSE V.ProdRank1y/CAST(V.PeersNo1y as float) END) AS Percentile1y
		, (CASE V.PrimaryObj WHEN 'IsraelsenVsPeers' THEN 
					V.ProdIRRank3y/CAST(V.PGIRNum3y as float)
				ELSE V.ProdRank3y/CAST(V.PeersNo3y as float) END) AS Percentile3y


INTO	#PREV
FROM	vw_AllPerfDataset AS V LEFT JOIN 
		tbl_Products AS P ON (
			V.id = P.id
			) LEFT JOIN
		tbl_FinanceAuM AS F ON (
			F.ShortCode = P.ShortCode
			--AND F.Company = P.Company
			AND V.RefDate = F.RefDate
			) 

WHERE	V.RefDate = @PrevDate
		AND (V.CloseDate > @PrevDate OR V.CloseDate IS NULL)
		AND DATEDIFF(mm,V.Inception,@PrevDate) > 1
		AND	(V.SoldAs = @SoldAs OR @SoldAs IS NULL)
		AND (V.IsSelect = @Select OR @Select IS NULL)
		AND (P.IsCore = @Core OR @Core IS NULL)

SELECT	L.Id
		, L.FundName
		, L.ShortCode
		, L.ISIN
		, L.IsSelect
		, L.PrimaryObj
        , (CASE L.PrimaryObj WHEN 'Index' THEN 1 ELSE 0 END) AS IsRefPrimObj
		, L.PeerGroupSelector
		, L.PeerGroup
		, ISNULL(L.Classification,'Unclassified') + ISNULL(' - ' + L.PeerGroup,'') AS PeerGroupLabel
        , L.BenName
		, 'Objective: <b>' + L.PrimaryObj + '</b>, Classification: <b>' + 
			ISNULL(L.Classification,'') + '</b> - <b>' + ISNULL(L.PeerGroup,'') + '</b>, Reference: <b>' +
			ISNULL(L.BenName,'') + '</b>'
			 AS RefsLabel
		, 'IM: <b>' + L.InvManager + '</b>, OMGI team: <b>' + L.OurTeam + '</b>, PM: <b>' +
			 L.OurPM + '</b>, Last change: <b>' + ISNULL(CONVERT(varchar, LastPMChange, 105), '')  + '</b>' AS PMLabel
		, '<b>' + L.InvManager + '</b> (' + 
			(CASE L.InvManager WHEN 'OMGI' THEN L.OurPM ELSE L.ExternalPM END) + '), <b>Inception</b>: ' +
			+ ISNULL(CONVERT(varchar, L.Inception, 105), '')  + ISNULL(', <b>Last change</b>: '  +
			+ CONVERT(varchar, L.LastPMChange, 105), '') AS SMManagerLabel
		, L.OurTeam
		, L.OurPM
		, L.InvManager
		, L.LastPMChange
		, L.ProductType
		, (CASE WHEN L.ProductType IN ('UCITS4', 'HF') THEN 'Offshore' ELSE 'Onshore' END) AS Domicile
		, L.AssetClass + 
			(CASE ISNULL(L.SubAssetClass, '') WHEN '' THEN '' ELSE ' (' + L.SubAssetClass + ')' END) 
			+ ', ' + L.Strategy +  ', ' +
			(CASE ISNULL(L.SizeBias, '') WHEN '' THEN '' ELSE L.Sizebias + ' <i>bias</i>, ' END) +
			(CASE ISNULL(L.GeoFocus, '') WHEN '' THEN '' ELSE L.GeoFocus + ' <i>focus</i>, ' END)
			+ L.Style 
			AS ProdChars
				, L.RelPerf1m AS LastRelPerf1mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN L.RelPerf1m ELSE NULL END) AS LastRelPerf1m
		, P.RelPerf1m AS PrevRelPerf1mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN P.RelPerf1m ELSE NULL END) AS PrevRelPerf1m
		, (CASE L.PrimaryObj WHEN 'Index' THEN 
				(CASE WHEN (L.RelPerf1m - P.RelPerf1m) > 0 THEN 'h' 
						WHEN (L.RelPerf1m - P.RelPerf1m) < 0 THEN 'i' 
						WHEN (L.RelPerf1m - P.RelPerf1m) = 0 THEN 'n' 
						ELSE null END) ELSE NULL END) AS RelPerf1mArr
		, (CASE WHEN (L.RelPerf1m - P.RelPerf1m) > 0 THEN 'h' 
						WHEN (L.RelPerf1m - P.RelPerf1m) < 0 THEN 'i' 
						WHEN (L.RelPerf1m - P.RelPerf1m) = 0 THEN 'n' 
						ELSE null END) AS RelPerf1mArrN

		, L.RelPerf3m AS LastRelPerf3mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN L.RelPerf3m ELSE NULL END) AS LastRelPerf3m
		, P.RelPerf3m AS PrevRelPerf3mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN P.RelPerf3m ELSE NULL END) AS PrevRelPerf3m
		, (CASE L.PrimaryObj WHEN 'Index' THEN 
				(CASE WHEN (L.RelPerf3m - P.RelPerf3m) > 0 THEN 'h' 
						WHEN (L.RelPerf3m - P.RelPerf3m) < 0 THEN 'i' 
						WHEN (L.RelPerf3m - P.RelPerf3m) = 0 THEN 'n' 
						ELSE null END) ELSE NULL END) AS RelPerf3mArr
		, (CASE WHEN (L.RelPerf3m - P.RelPerf3m) > 0 THEN 'h' 
						WHEN (L.RelPerf3m - P.RelPerf3m) < 0 THEN 'i' 
						WHEN (L.RelPerf3m - P.RelPerf3m) = 0 THEN 'n' 
						ELSE null END) AS RelPerf3mArrN

		, L.RelPerf6m AS LastRelPerf6mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN L.RelPerf6m ELSE NULL END) AS LastRelPerf6m
		, P.RelPerf6m AS PrevRelPerf6mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN P.RelPerf6m ELSE NULL END) AS PrevRelPerf6m
		, (CASE L.PrimaryObj WHEN 'Index' THEN 
				(CASE WHEN (L.RelPerf6m - P.RelPerf6m) > 0 THEN 'h' 
						WHEN (L.RelPerf6m - P.RelPerf6m) < 0 THEN 'i' 
						WHEN (L.RelPerf6m - P.RelPerf6m) = 0 THEN 'n' 
						ELSE null END) ELSE NULL END) AS RelPerf6mArr

        , L.RelPerf1y AS LastRelPerf1yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN L.RelPerf1y ELSE NULL END) AS LastRelPerf1y
        , P.RelPerf1y AS PrevRelPerf1yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN P.RelPerf1y ELSE NULL END) AS PrevRelPerf1y
		, (CASE L.PrimaryObj WHEN 'Index' THEN 
				(CASE WHEN (L.RelPerf1y - P.RelPerf1y) > 0 THEN 'h' 
						WHEN (L.RelPerf1y - P.RelPerf1y) < 0 THEN 'i' 
						WHEN (L.RelPerf1y - P.RelPerf1y) = 0 THEN 'n' 
						ELSE null END) ELSE NULL END) AS RelPerf1yArr
		, (CASE WHEN (L.RelPerf1y - P.RelPerf1y) > 0 THEN 'h' 
						WHEN (L.RelPerf1y - P.RelPerf1y) < 0 THEN 'i' 
						WHEN (L.RelPerf1y - P.RelPerf1y) = 0 THEN 'n' 
						ELSE null END) AS RelPerf1yArrN

		, L.RelPerf3y AS LastRelPerf3yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN L.RelPerf3y ELSE NULL END) AS LastRelPerf3y
		, P.RelPerf3y AS PrevRelPerf3yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN P.RelPerf3y ELSE NULL END) AS PrevRelPerf3y
		, (CASE L.PrimaryObj WHEN 'Index' THEN 
				(CASE WHEN (L.RelPerf3y - P.RelPerf3y) > 0 THEN 'h' 
						WHEN (L.RelPerf3y - P.RelPerf3y) < 0 THEN 'i' 
						WHEN (L.RelPerf3y - P.RelPerf3y) = 0 THEN 'n' 
						ELSE null END) ELSE NULL END) AS RelPerf3yArr
		, (CASE WHEN (L.RelPerf3y - P.RelPerf3y) > 0 THEN 'h' 
						WHEN (L.RelPerf3y - P.RelPerf3y) < 0 THEN 'i' 
						WHEN (L.RelPerf3y - P.RelPerf3y) = 0 THEN 'n' 
						ELSE null END) AS RelPerf3yArrN

		, L.Quartile1m AS LastQuart1mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE L.Quartile1m END) AS LastQuart1m
		, P.Quartile1m AS PrevQuart1mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE P.Quartile1m END) AS PrevQuart1m
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE
				(CASE WHEN (L.Quartile1m - P.Quartile1m) > 0 THEN 'i' 
						WHEN (L.Quartile1m - P.Quartile1m) < 0 THEN 'h' 
						WHEN (L.Quartile1m - P.Quartile1m) = 0 THEN 'n' 
						ELSE null END) END) AS Quart1mArr

		, L.Quartile3m AS LastQuart3mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE L.Quartile3m END) AS LastQuart3m
		, P.Quartile3m AS PrevQuart3mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE P.Quartile3m END) AS PrevQuart3m
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE
				(CASE WHEN (L.Quartile3m - P.Quartile3m) > 0 THEN 'i' 
						WHEN (L.Quartile3m - P.Quartile3m) < 0 THEN 'h' 
						WHEN (L.Quartile3m - P.Quartile3m) = 0 THEN 'n' 
						ELSE null END) END) AS Quart3mArr

		, L.Quartile6m AS LastQuart6mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE L.Quartile6m END) AS LastQuart6m
		, P.Quartile6m AS PrevQuart6mN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE P.Quartile6m END) AS PrevQuart6m
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE
				(CASE WHEN (L.Quartile6m - P.Quartile6m) > 0 THEN 'i' 
						WHEN (L.Quartile6m - P.Quartile6m) < 0 THEN 'h' 
						WHEN (L.Quartile6m - P.Quartile6m) = 0 THEN 'n' 
						ELSE null END) END) AS Quart6mArr

		, L.Quartile1y AS LastQuart1yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE L.Quartile1y END) AS LastQuart1y
		, P.Quartile1y AS PrevQuart1yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE P.Quartile1y END) AS PrevQuart1y
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE
				(CASE WHEN (L.Quartile1y - P.Quartile1y) > 0 THEN 'i' 
						WHEN (L.Quartile1y - P.Quartile1y) < 0 THEN 'h' 
						WHEN (L.Quartile1y - P.Quartile1y) = 0 THEN 'n' 
						ELSE null END) END) AS Quart1yArr

		, L.Quartile3y AS LastQuart3yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE L.Quartile3y END) AS LastQuart3y
		, P.Quartile3y AS PrevQuart3yN
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE P.Quartile3y END) AS PrevQuart3y
		, (CASE L.PrimaryObj WHEN 'Index' THEN NULL ELSE
				(CASE WHEN (L.Quartile3y - P.Quartile3y) > 0 THEN 'i' 
						WHEN (L.Quartile3y - P.Quartile3y) < 0 THEN 'h' 
						WHEN (L.Quartile3y - P.Quartile3y) = 0 THEN 'n' 
						ELSE null END) END) AS Quart3yArr
		, L.AuM AS LastAuM
		, P.AuM AS PrevAuM
		, (CASE WHEN (L.AuM - P.AuM) > 0 THEN 'h' 
						WHEN (L.AuM - P.AuM) < 0 THEN 'i' 
						WHEN (L.AuM - P.AuM) = 0 THEN 'n' 
						ELSE null END) AS AuMArr
		, L.MStarAuM AS LastMsAuM
		, L.BaseCCYIso + ISNULL(STR(L.MStarAuM,6,2), '') AS CharMsAuM
		, P.MStarAuM AS PastMsAuM
		, (CASE WHEN (L.MStarAuM - P.MStarAuM) > 0 THEN 'h' 
						WHEN (L.MStarAuM - P.MStarAuM) < 0 THEN 'i' 
						WHEN (L.MStarAuM - P.MStarAuM) = 0 THEN 'n' 
						ELSE null END) AS MsAuMArr
		, L.NP1m AS LastPerf1m
		, P.NP1m AS PrevPerf1m
		, (CASE WHEN (L.NP1m - P.NP1m) > 0 THEN 'h' 
						WHEN (L.NP1m - P.NP1m) < 0 THEN 'i' 
						WHEN (L.NP1m - P.NP1m) = 0 THEN 'n' 
						ELSE null END) AS NP1mArr
		, L.NP3m AS LastPerf3m
		, P.NP3m AS PrevPerf3m
		, (CASE WHEN (L.NP3m - P.NP3m) > 0 THEN 'h' 
						WHEN (L.NP3m - P.NP3m) < 0 THEN 'i' 
						WHEN (L.NP3m - P.NP3m) = 0 THEN 'n' 
						ELSE null END) AS NP3mArr
		, L.NP1y AS LastPerf1y
		, P.NP1y AS PrevPerf1y
		, (CASE WHEN (L.NP1y - P.NP1y) > 0 THEN 'h' 
						WHEN (L.NP1y - P.NP1y) < 0 THEN 'i' 
						WHEN (L.NP1y - P.NP1y) = 0 THEN 'n' 
						ELSE null END) AS NP1yArr

		, L.NP3y_a AS LastPerf3ya
		, P.NP3y_a AS PrevPerf3ya
		, (CASE WHEN (L.NP3y_a - P.NP3y_a) > 0 THEN 'h' 
						WHEN (L.NP3y_a - P.NP3y_a) < 0 THEN 'i' 
						WHEN (L.NP3y_a - P.NP3y_a) = 0 THEN 'n' 
						ELSE null END) AS NP3yArr

		, L.Percentile1m AS LastPerc1m
		, P.Percentile1m AS PrevPerc1m
		, (CASE WHEN (L.Percentile1m - P.Percentile1m) > 0 THEN 'i' 
						WHEN (L.Percentile1m - P.percentile1m) < 0 THEN 'h' 
						WHEN (L.Percentile1m - P.Percentile1m) = 0 THEN 'n' 
						ELSE null END) AS Perc1mArr

		, L.Percentile3m AS LastPerc3m
		, P.Percentile3m AS PrevPerc3m
		, (CASE WHEN (L.Percentile3m - P.Percentile3m) > 0 THEN 'i' 
						WHEN (L.Percentile3m - P.percentile3m) < 0 THEN 'h' 
						WHEN (L.Percentile3m - P.Percentile3m) = 0 THEN 'n' 
						ELSE null END) AS Perc3mArr
		, L.Percentile1y AS LastPerc1y
		, P.Percentile1y AS PrevPerc1y
		, (CASE WHEN (L.Percentile1y - P.Percentile1y) > 0 THEN 'i' 
						WHEN (L.Percentile1y - P.percentile1y) < 0 THEN 'h' 
						WHEN (L.Percentile1y - P.Percentile1y) = 0 THEN 'n' 
						ELSE null END) AS Perc1yArr

		, L.Percentile3y AS LastPerc3y
		, P.Percentile3y AS PrevPerc3y
		, (CASE WHEN (L.Percentile3y - P.Percentile3y) > 0 THEN 'i' 
						WHEN (L.Percentile3y - P.percentile3y) < 0 THEN 'h' 
						WHEN (L.Percentile3y - P.Percentile3y) = 0 THEN 'n' 
						ELSE null END) AS Perc3yArr

		, @RefDate AS RefDate
		, @PrevDate AS PrevDate
		, @SoldAs AS Filter
		
FROM #LAST AS L LEFT JOIN
	#PREV AS P ON (L.Id = P.Id)
		

DROP TABLE #LAST
DROP TABLE #PREV

-----------------------------------------------------------------

GO

GRANT EXECUTE ON dbo.spS_GetShortPerfRep TO [OMAM\Compliance]