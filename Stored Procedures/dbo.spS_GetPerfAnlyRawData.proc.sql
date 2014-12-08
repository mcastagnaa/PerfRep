USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPerfAnlyRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPerfAnlyRawData
GO

CREATE PROCEDURE dbo.spS_GetPerfAnlyRawData
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
, OurPM
, OurAnalyst
, OurTeam
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
, Ben1m/ 100 AS Ben1m
, Ben3m/100 AS Ben3m
, Ben6m/100 AS Ben6m
, Ben1y/100 AS Ben1y
, Ben2y/100 AS Ben2y
, Ben3y/100 AS Ben3y
, Ben5y/100 AS Beny
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
, ProdBetaYtD
, ProdBeta1y
, ProdBeta2y
, ProdBeta3y
, ProdBeta5y
, [ProdBetay-1]
, [ProdBetay-2]
, [ProdBetay-3]
, [ProdBetay-4]
, [ProdBetay-5]
, ProdBetaEo2y_TD
, ProdBetaEo3y_TD
, ProdBeta_SI
, ProdBeta_SLMC AS ProdBeta_SLMC
, ProdAlphaYtD/100 AS ProdAlphaYtD
, ProdAlpha1y/100 AS ProdAlpha1y
, ProdAlpha2y/100 AS ProdAlpha2y
, ProdAlpha3y/100 AS ProdAlpha3y
, ProdAlpha5y/100 AS ProdAlpha5y
, [ProdAlphay-1]/100 AS [ProdAlphay-1]
, [ProdAlphay-2]/100 AS [ProdAlphay-2]
, [ProdAlphay-3]/100 AS [ProdAlphay-3]
, [ProdAlphay-4]/100 AS [ProdAlphay-4]
, [ProdAlphay-5]/100 AS [ProdAlphay-5]
, ProdAlphaEo2y_TD/100 AS ProdAlphaEo2y_TD
, ProdAlphaEo3y_TD/100 AS ProdAlphaEo3y_TD
, ProdAlpha_SI/100 AS ProdAlpha_SI
, ProdAlpha_SLMC/100 AS ProdAlpha_SLMC
, ProdTEYtD/100 AS ProdTEYtD
, ProdTE1y/100 AS ProdTE1y
, ProdTE2y/100 AS ProdTE2y
, ProdTE3y/100 AS ProdTE3y
, ProdTE5y/100 AS ProdTE5y
, [ProdTEy-1]/100 AS [ProdTEy-1]
, [ProdTEy-2]/100 AS [ProdTEy-2]
, [ProdTEy-3]/100 AS [ProdTEy-3]
, [ProdTEy-4]/100 AS [ProdTEy-4]
, [ProdTEy-5]/100 AS [ProdTEy-5]
, ProdTEEo2y_TD/100 AS ProdTEEo2y_TD
, ProdTEEo3y_TD/100 AS ProdTEEo3y_TD
, ProdStDYtD/100 AS ProdStDYtD
, BenStDYtD/100 AS BenStDYtD
, ProdStD1y/100 AS ProdStD1y
, BenStD1y/100 AS BenStD1y
--, PGMedStD1y/100 AS PGMedStD1y
, ProdStD2y/100 AS ProdStD2y
, BenStD2y/100 AS BenStD2y
--, PGMedStD2y/100 AS PGMedStD2y
, ProdStD3y/100 AS ProdStD3y
, BenStD3y/100 AS BenStD3y
--, PGMedStD3y/100 AS PGMedStD3y
, ProdStD5y/100 AS ProdStD5y
, BenStD5y/100 AS BenStD5y
--, PGMedStD5y/100 AS PGMedStD5y
, [ProdStDy-1]/100 AS [ProdStDy-1]
, [BenStDy-1]/100 AS [BenStDy-1]
--, [PGMedStDy-1]/100 AS [PGMedStDy-1]
, [ProdStDy-2]/100 AS [ProdStDy-2]
, [BenStDy-2]/100 AS [BenStDy-2]
--, [PGMedStDy-2]/100 AS [PGMedStDy-2]
, [ProdStDy-3]/100 AS [ProdStDy-3]
, [BenStDy-3]/100 AS [BenStDy-3]
--, [PGMedStDy-3]/100 AS [PGMedStDy-3]
, [ProdStDy-4]/100 AS [ProdStDy-4]
, [BenStDy-4]/100 AS [BenStDy-4]
--, [PGMedStDy-4]/100 AS [PGMedStDy-4]
, [ProdStDy-5]/100 AS [ProdStDy-5]
, [BenStDy-5]/100 AS [BenStDy-5]
--, [PGMedStDy-5]/100 AS [PGMedStDy-5]
, ProdStDEo2y_TD/100 AS ProdStDEo2y_TD
, BenStDEo2y_TD/100 AS BenStDEo2y_TD
--, PGMedStDEo2y_TD/100 AS PGMedStDEo2y_TD
, ProdStDEo3y_TD/100 AS ProdStDEo3y_TD
, BenStDEo3y_TD/100 AS BenStDEo3y_TD
--, PGMedStDEo3y_TD/100 AS PGMedStDEo3y_TD
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

, CAST(ProdIRRank1m AS float)/PGIRNum1m AS ProdIR1mPerc
, CAST(ProdIRRank3m AS float)/PGIRNum3m AS ProdIR3mPerc
, CAST(ProdIRRank6m AS float)/PGIRNum6m AS ProdIR6mPerc
, CAST(ProdIRRank1y AS float)/PGIRNum1y AS ProdIR1yPerc
, CAST(ProdIRRank2y AS float)/PGIRNum2y AS ProdIR2yPerc
, CAST(ProdIRRank3y AS float)/PGIRNum3y AS ProdIR3yPerc
, CAST(ProdIRRank5y AS float)/PGIRNum5y AS ProdIR5yPerc
, CAST(ProdIRRankYtD AS float)/PGIRNumYtD AS ProdIRYtDPerc
, CAST([ProdIRRanky-1] AS float)/[PGIRNumy-1] AS [ProdIRy-1Perc]
, CAST([ProdIRRanky-2] AS float)/[PGIRNumy-1] AS [ProdIRy-2Perc]
, CAST([ProdIRRanky-3] AS float)/[PGIRNumy-3] AS [ProdIRy-3Perc]
, CAST([ProdIRRanky-4] AS float)/[PGIRNumy-4] AS [ProdIRy-4Perc]
, CAST([ProdIRRanky-5] AS float)/[PGIRNumy-5] AS [ProdIRy-5Perc]
, CAST(ProdIRRankEo2y_TD AS float)/PGIRNumEo2y_TD AS ProdIREo2y_TDPerc
, CAST(ProdIRRankEo3y_TD AS float)/PGIRNumEo3y_TD AS ProdIREo3y_TDPerc
, CAST(ProdIRRank_SI AS float)/PGIRNum_SI AS ProdIR_SIPerc

, dbo.fn_GetQuartile(CAST(ProdIRRank1m AS float)/PGIRNum1m, 1) AS ProdIR1mQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank3m AS float)/PGIRNum3m, 1) AS ProdIR3mQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank6m AS float)/PGIRNum6m, 1) AS ProdIR6mQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank1y AS float)/PGIRNum1y, 1) AS ProdIR1yQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank2y AS float)/PGIRNum2y, 1) AS ProdIR2yQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank3y AS float)/PGIRNum3y, 1) AS ProdIR3yQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank5y AS float)/PGIRNum5y, 1) AS ProdIR5yQuart
, dbo.fn_GetQuartile(CAST(ProdIRRankYtD AS float)/PGIRNumYtD, 1) AS ProdIRYtDQuart
, dbo.fn_GetQuartile(CAST([ProdIRRanky-1] AS float)/[PGIRNumy-1], 1) AS [ProdIRy-1Quart]
, dbo.fn_GetQuartile(CAST([ProdIRRanky-2] AS float)/[PGIRNumy-2], 1) AS [ProdIRy-2Quart]
, dbo.fn_GetQuartile(CAST([ProdIRRanky-3] AS float)/[PGIRNumy-3], 1) AS [ProdIRy-3Quart]
, dbo.fn_GetQuartile(CAST([ProdIRRanky-4] AS float)/[PGIRNumy-4], 1) AS [ProdIRy-4Quart]
, dbo.fn_GetQuartile(CAST([ProdIRRanky-5] AS float)/[PGIRNumy-5], 1) AS [ProdIRy-5Quart]
, dbo.fn_GetQuartile(CAST(ProdIRRankEo2y_TD AS float)/PGIRNumEo2y_TD, 1) AS ProdIREo2y_TDQuart
, dbo.fn_GetQuartile(CAST(ProdIRRankEo3y_TD AS float)/PGIRNumEo3y_TD, 1) AS ProdIREo3y_TDQuart
, dbo.fn_GetQuartile(CAST(ProdIRRank_SI AS float)/PGIRNum_SI, 1) AS ProdIR_SIQuart


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

GRANT EXECUTE ON dbo.spS_GetPerfAnlyRawData TO [OMAM\Compliance]