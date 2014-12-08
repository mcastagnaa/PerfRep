USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPerfRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPerfRawData
GO

CREATE PROCEDURE dbo.spS_GetPerfRawData
	@RefDate datetime
	, @SoldAs integer
	, @Company nvarchar(50)
	, @Desk nvarchar(50)

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Id
, FundName
, ShortCode
, Company
, BaseCCYIso
, Inception
, LastPMChange
, BenCode
, BenName
, PrimaryObj
, InvManager
, OurTeam
, OurPM
--, OurAnalyst
, SoldAs
, InAs
, IUProduct
, Classification
, PeerGroup
, ISNULL(Classification + '-' + PeerGroup, 'No peer group') AS PeerGroupLabel
, RefDate
, BizDate AS LastBusinessDay
, AuM
, ProdTER
, NP1m/100 AS NP1m
, NP3m/100 AS NP3m
, NP6m/100 AS NP6m
, NP1y/100 AS NP1y
, NP2y/100 AS NP2y
, NP3y/100 AS NP3y
, NP5y/100 AS NP5y
, NPYtD/100 AS NPYtD
, [NPy-1]/100 AS [NPy-1]
, [NPy-2]/100 AS [NPy-2]
, [NPy-3]/100 AS [NPy-3]
, [NPy-4]/100 AS [NPy-4]
, [NPy-5]/100 AS [NPy-5]
, NPEo2y_TD/100 AS NPEo2y_TD
, NPEo3y_TD/100 AS NPEo3y_TD
, NP_SI/100 AS NP_SI
, NP_SLMC/100 AS NP_SLMC
, NP2y_a/100 AS NP2y_a
, NP3y_a/100 AS NP3y_a
, NP5y_a/100 AS NP5y_a
, NPEo2y_TD_a/100 AS NPEo2y_TD_a
, NPEo3y_TD_a/100 AS NPEo3y_TD_a
, NP_SI_a/100 AS NP_SI_a
, NP_SLMC_a/100 AS NP_SLMC_a
, ((ProdTER/12 * 1) + NP1m)/100 AS GP1m
, ((ProdTER/12 * 3) + NP3m)/100 AS GP3m
, ((ProdTER/12 * 6) + NP6m)/100 AS GP6m
, (ProdTER + NP1y)/100 AS GP1y
--, ((POWER(1+ISNULL(ProdTER,1)/100, 3)-1) * 100 + NP3y)/100 AS GP3y
, ((POWER((1 + ProdTER/100), 2) - 1) * 100 + NP2y)/100 AS GP2y
, ((POWER((1 + ProdTER/100), 3) - 1) * 100 + NP3y)/100 AS GP3y
, ((POWER((1 + ProdTER/100), 5) - 1) * 100 + NP5y)/100 AS GP5y
,(ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 1) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/365
	 	+ NPYtD)/100 AS GPYtD
, (ProdTER + [NPy-1])/100 [GPy-1]
, (ProdTER + [NPy-2])/100 [GPy-2]
, (ProdTER + [NPy-3])/100 [GPy-3]
, (ProdTER + [NPy-4])/100 [GPy-4]
, (ProdTER + [NPy-5])/100 [GPy-5]
, (ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 2) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/ 365
	 + NPEo2y_TD)/100 AS GPEo2y_TD
, (ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 3) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/ 365
	 + NPEo3y_TD)/100 AS GPEo3y_TD
, (ProdTER * 
	CAST(DATEDIFF(dd, Inception, RefDate) AS float)/ 365
	 + NP_SI)/100 AS GP_SI
, (ProdTER * 
	CAST(DATEDIFF(dd, LastPMChange, RefDate) AS float)/ 365
	 + NP_SLMC)/100 AS GP_SLMC
, (ProdTER + NP2y_a)/100 AS GP2y_a
, (ProdTER + NP3y_a)/100 AS GP3y_a
, (ProdTER + NP5y_a)/100 AS GP5y_a
, (ProdTER + NPEo2y_TD_a)/100 AS GPEo2y_TD_a
, (ProdTER + NPEo3y_TD_a)/100 AS GPEo3y_TD_a
, (ProdTER + NP_SI_a)/100 AS GP_SI_a
, (ProdTER + NP_SLMC_a)/100 AS GP_SLMC_a
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank1m ELSE ProdRank1m END) AS ProdRank1m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank3m ELSE ProdRank3m END) AS ProdRank3m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank6m ELSE ProdRank6m END) AS ProdRank6m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank1y ELSE ProdRank1y END) AS ProdRank1y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank2y ELSE ProdRank2y END) AS ProdRank2y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank3y ELSE ProdRank3y END) AS ProdRank3y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank5y ELSE ProdRank5y END) AS ProdRank5y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRankYtD ELSE ProdRankYtD END) AS ProdRankYtD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [ProdIRRanky-1] ELSE [ProdRanky-1] END) AS [ProdRanky-1]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [ProdIRRanky-2] ELSE [ProdRanky-2] END) AS [ProdRanky-2]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [ProdIRRanky-3] ELSE [ProdRanky-3] END) AS [ProdRanky-3]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [ProdIRRanky-4] ELSE [ProdRanky-4] END) AS [ProdRanky-4]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [ProdIRRanky-5] ELSE [ProdRanky-5] END) AS [ProdRanky-5]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRankEo2y_TD ELSE ProdRankEo2y_TD END) AS ProdRankEo2y_TD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRankEo2y_TD ELSE ProdRankEo3y_TD END) AS ProdRankEo3y_TD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN ProdIRRank_SI ELSE ProdRank_SI END) AS ProdRank_SI
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN null ELSE ProdRank_SLMC END) AS ProdRank_SLMC
, Ben1m/ 100 AS Ben1m
, Ben3m/100 AS Ben3m
, Ben6m/100 AS Ben6m
, Ben1y/100 AS Ben1y
, Ben2y/100 AS Ben2y
, Ben3y/100 AS Ben3y
, Ben5y/100 AS Ben5y
, BenYtD/100 AS BenYtD
, [Beny-1]/100 AS [Beny-1]
, [Beny-2]/100 AS [Beny-2]
, [Beny-3]/100 AS [Beny-3]
, [Beny-4]/100 AS [Beny-4]
, [Beny-5]/100 AS [Beny-5]
, BenEo2y_TD/100 AS BenEo2y_TD
, BenEo3y_TD/100 AS BenEo3y_TD
, Ben2y_a/100 AS Ben2y_a
, Ben3y_a/100 AS Ben3y_a
, Ben5y_a/100 AS Ben5y_a
, BenEo2y_TD_a/100 AS BenEo2y_TD_a
, BenEo3y_TD_a/100 AS BenEo3y_TD_a
, Ben_SI/100 AS Ben_SI
, Ben_SI_a/100 AS Ben_SI_a
, Ben_SLMC/100 AS Ben_SLMC
, Ben_SLMC_a/100 AS Ben_SLMC_a
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum1m ELSE PeersNo1m END) AS PeersNo1m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum3m ELSE PeersNo3m END) AS PeersNo3m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum6m ELSE PeersNo6m END) AS PeersNo6m
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum1y ELSE PeersNo1y END) AS PeersNo1y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum2y ELSE PeersNo2y END) AS PeersNo2y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum3y ELSE PeersNo3y END) AS PeersNo3y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum5y ELSE PeersNo5y END) AS PeersNo5y
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNumYtD ELSE PeersNoYtD END) AS PeersNoYtD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [PGIRNumy-1] ELSE [PeersNoy-1] END) AS [PeersNoy-1]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [PGIRNumy-2] ELSE [PeersNoy-2] END) AS [PeersNoy-2]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [PGIRNumy-3] ELSE [PeersNoy-3] END) AS [PeersNoy-3]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [PGIRNumy-4] ELSE [PeersNoy-4] END) AS [PeersNoy-4]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN [PGIRNumy-5] ELSE [PeersNoy-5] END) AS [PeersNoy-5]
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNumEo2y_TD ELSE PeersNoEo2y_TD END) AS PeersNoEo2y_TD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNumEo3y_TD ELSE PeersNoEo3y_TD END) AS PeersNoEo3y_TD
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN PGIRNum_SI ELSE PeersNo_SI END) AS PeersNo_SI
, (CASE PrimaryObj WHEN 'IsraelsenVsPeers' THEN null ELSE PeersNo_SLMC END) AS PeersNo_SLMC
/*, (CASE WHEN ProdRank1m IS NULL THEN NULL ELSE PeersNo1m END) AS PeersNo1m
, (CASE WHEN ProdRank3m IS NULL THEN NULL ELSE PeersNo3m END) AS PeersNo3m
, (CASE WHEN ProdRank6m IS NULL THEN NULL ELSE PeersNo6m END) AS PeersNo6m
, (CASE WHEN ProdRank1y IS NULL THEN NULL ELSE PeersNo1y END) AS PeersNo1y
, (CASE WHEN ProdRank2y IS NULL THEN NULL ELSE PeersNo2y END) AS PeersNo2y
, (CASE WHEN ProdRank3y IS NULL THEN NULL ELSE PeersNo3y END) AS PeersNo3y
, (CASE WHEN ProdRank1m IS NULL THEN NULL ELSE PeersNo1m END) AS PeersNo5y
, (CASE WHEN ProdRankYtD IS NULL THEN NULL ELSE PeersNoYD END) AS PeersNoYtD
, (CASE WHEN [ProdRanky-1] IS NULL THEN NULL ELSE [PeersNoy-1] END) AS [PeersNoy-1]
, (CASE WHEN [ProdRanky-2] IS NULL THEN NULL ELSE [PeersNoy-2] END) AS [PeersNoy-2]
, (CASE WHEN [ProdRanky-3] IS NULL THEN NULL ELSE [PeersNoy-3] END) AS [PeersNoy-3]
, (CASE WHEN [ProdRanky-4] IS NULL THEN NULL ELSE [PeersNoy-4] END) AS [PeersNoy-4]
, (CASE WHEN [ProdRanky-5] IS NULL THEN NULL ELSE [PeersNoy-5] END) AS [PeersNoy-5]
, (CASE WHEN ProdRankEo2y_TD IS NULL THEN NULL ELSE PeersNoEo2y_TD END) AS PeersNoEo2y_TD
, (CASE WHEN ProdRankEo3y_TD IS NULL THEN NULL ELSE PeersNoEo3y_TD END) AS PeersNoEo3y_TD
, (CASE WHEN ProdRank_SI IS NULL THEN NULL ELSE PeersNo_SI END) AS PeersNo_SI*/
, PG1stQ_r1m/100 AS PG1stQ_r1m
, PG1stQ_r3m/100 AS PG1stQ_r3m
, PG1stQ_r6m/100 AS PG1stQ_r6m
, PG1stQ_r1y/100 AS PG1stQ_r1y
, PG1stQ_r2y/100 AS PG1stQ_r2y
, PG1stQ_r3y/100 AS PG1stQ_r3y
, PG1stQ_r5y/100 AS PG1stQ_r5y
, PG1stQ_rYtD/100 AS PG1stQ_rYtD
, [PG1stQ_ry-1]/100 AS [PG1stQ_ry-1]
, [PG1stQ_ry-2]/100 AS [PG1stQ_ry-2]
, [PG1stQ_ry-3]/100 AS [PG1stQ_ry-3]
, [PG1stQ_ry-4]/100 AS [PG1stQ_ry-4]
, [PG1stQ_ry-5]/100 AS [PG1stQ_ry-5]
, PG1stQ_rEo2y_TD/100 AS PG1stQ_rEo2y_TD
, PG1stQ_rEo3y_TD/100 AS PG1stQ_rEo3y_TD
, PG1stQ_r2y_a/100 AS PG1stQ_r2y_a
, PG1stQ_r3y_a/100 AS PG1stQ_r3y_a
, PG1stQ_r5y_a/100 AS PG1stQ_r5y_a
, PG1stQ_rEo2y_TD_a/100 AS PG1stQ_rEo2y_TD_a
, PG1stQ_rEo3y_TD_a/100 AS PG1stQ_rEo3y_TD_a
, PG1stQ_r_SI/100 AS PG1stQ_r_SI
, PG1stQ_r_SI_a/100 AS PG1stQ_r_SI_a
, PG1stQ_r_SLMC/100 AS PG1stQ_r_SLMC
, PG1stQ_r_SLMC_a/100 AS PG1stQ_r_SLMC_a
, PG3stQ_r1m/100 AS PG3stQ_r1m
, PG3stQ_r3m/100 AS PG3stQ_r3m
, PG3stQ_r6m/100 AS PG3stQ_r6m
, PG3stQ_r1y/100 AS PG3stQ_r1y
, PG3stQ_r2y/100 AS PG3stQ_r2y
, PG3stQ_r3y/100 AS PG3stQ_r3y
, PG3stQ_r5y/100 AS PG3stQ_r5y
, PG3stQ_rYtD/100 AS PG3stQ_rYtD
, [PG3stQ_ry-1]/100 AS [PG3stQ_ry-1]
, [PG3stQ_ry-2]/100 AS [PG3stQ_ry-2]
, [PG3stQ_ry-3]/100 AS [PG3stQ_ry-3]
, [PG3stQ_ry-4]/100 AS [PG3stQ_ry-4]
, [PG3stQ_ry-5]/100 AS [PG3stQ_ry-5]
, PG3stQ_rEo2y_TD/100 AS PG3stQ_rEo2y_TD
, PG3stQ_rEo3y_TD/100 AS PG3stQ_rEo3y_TD
, PG3stQ_r2y_a/100 AS PG3stQ_r2y_a
, PG3stQ_r3y_a/100 AS PG3stQ_r3y_a
, PG3stQ_r5y_a/100 AS PG3stQ_r5y_a
, PG3stQ_rEo2y_TD_a/100 AS PG3stQ_rEo2y_TD_a
, PG3stQ_rEo3y_TD_a/100 AS PG3stQ_rEo3y_TD_a
, PG3stQ_r_SI/100 AS PG3stQ_r_SI
, PG3stQ_r_SI_a/100 AS PG3stQ_r_SI_a
, PG3stQ_r_SLMC/100 AS PG3stQ_r_SLMC
, PG3stQ_r_SLMC_a/100 AS PG3stQ_r_SLMC_a
, PGavg_r1m/100 AS PGavg_r1m
, PGavg_r3m/100 AS PGavg_r3m
, PGavg_r6m/100 AS PGavg_r6m
, PGavg_r1y/100 AS PGavg_r1y
, PGavg_r2y/100 AS PGavg_r2y
, PGavg_r3y/100 AS PGavg_r3y
, PGavg_r5y/100 AS PGavg_r5y
, PGavg_rYtD/100  AS PGavg_rYtD
, [PGavg_ry-1]/100 AS [PGavg_ry-1]
, [PGavg_ry-2]/100 AS [PGavg_ry-2]
, [PGavg_ry-3]/100 AS [PGavg_ry-3]
, [PGavg_ry-4]/100 AS [PGavg_ry-4]
, [PGavg_ry-5]/100 AS [PGavg_ry-5]
, PGavg_rEo2y_TD/100 AS PGavg_rEo2y_TD
, PGavg_rEo3y_TD/100 AS PGavg_rEo3y_TD
, PGavg_r2y_a/100 AS PGavg_r2y_a
, PGavg_r3y_a/100 AS PGavg_r3y_a
, PGavg_r5y_a/100 AS PGavg_r5y_a
, PGavg_rEo2y_TD_a/100 AS PGavg_rEo2y_TD_a
, PGavg_rEo3y_TD_a/100 AS PGavg_rEo3y_TD_a
, PGavg_r_SI/100 AS PGavg_r_SI
, PGavg_r_SI_a/100 AS PGavg_r_SI_a
, PGavg_r_SLMC/100 AS PGavg_r_SLMC
, PGavg_r_SLMC_a/100 AS PGavg_r_SLMC_a
, PGmed_r1m/100 AS PGmed_r1m
, PGmed_r3m/100 AS PGmed_r3m
, PGmed_r6m/100 AS PGmed_r6m
, PGmed_r1y/100 AS PGmed_r1y
, PGmed_r2y/100 AS PGmed_r2y
, PGmed_r3y/100 AS PGmed_r3y
, PGmed_r5y/100 AS PGmed_r5y
, PGmed_rYtD/100 AS PGmed_rYtD
, [PGmed_ry-1]/100 AS [PGmed_ry-1]
, [PGmed_ry-2]/100 AS [PGmed_ry-2]
, [PGmed_ry-3]/100 AS [PGmed_ry-3]
, [PGmed_ry-4]/100 AS [PGmed_ry-4]
, [PGmed_ry-5]/100 AS [PGmed_ry-5]
, PGmed_rEo2y_TD/100 AS PGmed_rEo2y_TD
, PGmed_rEo3y_TD/100 AS PGmed_rEo3y_TD
, PGmed_r2y_a/100 AS PGmed_r2y_a
, PGmed_r3y_a/100 AS PGmed_r3y_a
, PGmed_r5y_a/100 AS PGmed_r5y_a
, PGmed_rEo2y_TD_a/100 AS PGmed_rEo2y_TD_a
, PGmed_rEo3y_TD_a/100 AS PGmed_rEo3y_TD_a
, PGmed_r_SI/100 AS PGmed_r_SI
, PGmed_r_SI_a/100 AS PGmed_r_SI_a
, PGmed_r_SLMC/100 AS PGmed_r_SLMC
, PGmed_r_SLMC_a/100 AS PGmed_r_SLMC_a
, ProdIR1m
, ProdIR3m
, ProdIR6m
, ProdIRYtD
, ProdIR1y
, ProdIR2y
, ProdIR3y
, ProdIR5y
, [ProdIRy-1]
, [ProdIRy-2]
, [ProdIRy-3]
, [ProdIRy-4]
, [ProdIRy-5]
, ProdIREo2y_TD
, ProdIREo3y_TD
, ProdIR_SI
/*, ProdIRRank1m
, ProdIRRank3m
, ProdIRRank6m
, ProdIRRankYtD
, ProdIRRank1y
, ProdIRRank2y
, ProdIRRank3y
, ProdIRRank5y
, [ProdIRRanky-1]
, [ProdIRRanky-2]
, [ProdIRRanky-3]
, [ProdIRRanky-4]
, [ProdIRRanky-5]
, ProdIRRankEo2y_TD
, ProdIRRankEo3y_TD
, ProdIRRank_SI
, PGIRNum1m
, PGIRNum3m
, PGIRNum6m
, PGIRNumYtD
, PGIRNum1y
, PGIRNum2y
, PGIRNum3y
, PGIRNum5y
, [PGIRNumy-1]
, [PGIRNumy-2]
, [PGIRNumy-3]
, [PGIRNumy-4]
, [PGIRNumy-5]
, PGIRNumEo2y_TD
, PGIRNumEo3y_TD
, PGIRNum_SI
*/

FROM	vw_AllPerfDataset AS DSet

WHERE	DSet.RefDate = @RefDate
	AND CHARINDEX(DSet.SoldAS, 
		(CASE @SoldAs
			WHEN 1 THEN 
			'_OEIC_NURS_AIF_UCITS4_LifePension_'
			WHEN 2 THEN
			'_HF_'
			WHEN 3 THEN
			'_Mandate_'
			END) 
		) <> 0
	AND ((@Company is null) OR 
		(CHARINDEX(DSet.Company,
			(CASE @Company
				WHEN 'SIML' THEN '_SIML_SLAC_'
				ELSE @Company
				END)
			) <> 0))
	AND (@Desk IS NULL OR @Desk = DSet.OurTeam)
	AND (DSet.Inception < @RefDate)
	AND ((Dset.CloseDate IS NULL) OR (DSet.CloseDate > @RefDate))


----------------------------------------------------------------------------------

GO

GRANT EXECUTE ON dbo.spS_GetPerfRawData TO [OMAM\Compliance]