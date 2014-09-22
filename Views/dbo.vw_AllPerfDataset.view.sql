USE PerfRep
GO

IF  EXISTS (
SELECT 	* FROM dbo.sysobjects 
WHERE 	id = OBJECT_ID(N'[vw_AllPerfDataset]') AND 
	OBJECTPROPERTY(id, N'IsView') = 1
)
DROP VIEW vw_AllPerfDataset

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW vw_AllPerfDataset
AS 

SELECT	Funds.Id
	, Funds.ShortCode
	, Funds.Company
	, Funds.FundName + (CASE 
		WHEN Funds.RefShClass IS NULL THEN '' 
		ELSE ' - ' + Funds.RefShClass END ) AS FundName
	, Funds.FundName AS FundLongName
	, Funds.RefShClass
	, Funds.BaseCCYIso
	, Funds.InceptionDate AS Inception
	, Funds.CloseDate
	, Funds.LastPMChange
	, Benchs.Id AS BenId
	, Benchs.Code AS BenCode
	, Benchs.LongName AS BenName
	, Funds.PrimaryObj
	, Funds.InvManager
	, Funds.OurTeam
	, Desks.LongName AS DeskName
	, Funds.OurPM
	, Funds.OurAnalyst
	, Funds.SoldAs
	, Funds.InAs
	, Funds.IsSelect
	, Peers.CatSelector AS Classification
	, (CASE Peers.CatSelector
		WHEN 'MStar' THEN Peers.MStarCat
		WHEN 'IMA' THEN Peers.IMACat
		WHEN 'ABI' THEN Peers.ABICat
		WHEN 'GIF' THEN Peers.GIFCat
		WHEN 'Custom' THEN Peers.CustomCat
		END) AS PeerGroup
	, (CASE Funds.InAs
		WHEN 'IU' THEN
		(CASE 	WHEN IsMultiManager = 1 THEN 'MoM'
			WHEN IsFoF = 1 THEN 'FoF'
			ELSE 'IUSStrat'
		END)
		WHEN 'Mandate' THEN 'ExtSStrat'
		ELSE 'MissingClass'
	END) AS IUProduct
	, FundP.RefDate
	, FundP.BizDate
	, FundP.AuM
	, FundP.NP1m
	, FundP.NP3m
	, FundP.NP6m
	, FundP.NP1y
	, FundP.NP2y
	, FundP.NP3y
	, FundP.NP5y
	, FundP.NPYtD
	, DYf.[NPy-1]
	, DYf.[NPy-2]
	, DYf.[NPy-3]
	, DYf.[NPy-4]
	, DYf.[NPy-5]
	, FundP.NPEo2y_TD
	, FundP.NPEo3y_TD
	, FundP.NP_SI
	, FundP.NP2y_a
	, FundP.NP3y_a
	, FundP.NP5y_a
	, FundP.NPEo2y_TD_a
	, FundP.NPEo3y_TD_a
	, FundP.NP_SI_a
	, FundP.ProdRank1m
	, FundP.ProdRank3m
	, FundP.ProdRank6m
	, FundP.ProdRank1y
	, FundP.ProdRank2y
	, FundP.ProdRank3y
	, FundP.ProdRank5y
	, FundP.ProdRankYtD
	, DYf.[ProdRanky-1]
	, DYf.[ProdRanky-2]
	, DYf.[ProdRanky-3]
	, DYf.[ProdRanky-4]
	, DYf.[ProdRanky-5]
	, FundP.ProdRankEo2y_TD
	, FundP.ProdRankEo3y_TD
	, FundP.ProdRank_SI 
	, BenchP.Ben1m
	, BenchP.Ben3m
	, BenchP.Ben6m
	, BenchP.Ben1y
	, BenchP.Ben2y
	, BenchP.Ben3y
	, BenchP.Ben5y
	, BenchP.BenYtD
	, DYf.[Beny-1]
	, DYf.[Beny-2]
	, DYf.[Beny-3]
	, DYf.[Beny-4]
	, DYf.[Beny-5]
	, BenchP.BenEo2y_TD
	, BenchP.BenEo3y_TD
	, BenchP.Ben2y_a
	, BenchP.Ben3y_a
	, BenchP.Ben5y_a
	, BenchP.BenEo2y_TD_a
	, BenchP.BenEo3y_TD_a

 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStDYtD END) AS BenStDYtD
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStD1y END) AS BenStD1y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStD2y END) AS BenStD2y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStD3y END) AS BenStD3y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStD5y END) AS BenStD5y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[BenStDy-1] END) AS [BenStDy-1]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[BenStDy-2] END) AS [BenStDy-2]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[BenStDy-3] END) AS [BenStDy-3]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[BenStDy-4] END) AS [BenStDy-4]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[BenStDy-5] END) AS [BenStDy-5]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStDEo2y_TD END) AS BenStDEo2y_TD
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE BenchP.BenStDEo3y_TD END) AS BenStDEo3y_TD

	, BenchPSI.Ben_SI
	, BenchPSI.Ben_SI_a
	, PeersP.PeersNo1m
	, PeersP.PeersNo3m
	, PeersP.PeersNo6m
	, PeersP.PeersNo1y
	, PeersP.PeersNo2y
	, PeersP.PeersNo3y
	, PeersP.PeersNo5y
	, PeersP.PeersNoYtD
	, DYf.[PeersNoy-1]
	, DYf.[PeersNoy-2]
	, DYf.[PeersNoy-3]
	, DYf.[PeersNoy-4]
	, DYf.[PeersNoy-5]
	, PeersP.PeersNoEo2y_TD
	, PeersP.PeersNoEo3y_TD
	, PeersP.PG1stQ_r1m
	, PeersP.PG1stQ_r3m
	, PeersP.PG1stQ_r6m
	, PeersP.PG1stQ_r1y
	, PeersP.PG1stQ_r2y
	, PeersP.PG1stQ_r3y
	, PeersP.PG1stQ_r5y
	, PeersP.PG1stQ_rYtD
	, DYf.[PG1stQ_ry-1]
	, DYf.[PG1stQ_ry-2]
	, DYf.[PG1stQ_ry-3]
	, DYf.[PG1stQ_ry-4]
	, DYf.[PG1stQ_ry-5]
	, PeersP.PG1stQ_rEo2y_TD
	, PeersP.PG1stQ_rEo3y_TD
	, PeersP.PG1stQ_r2y_a
	, PeersP.PG1stQ_r3y_a
	, PeersP.PG1stQ_r5y_a
	, PeersP.PG1stQ_rEo2y_TD_a
	, PeersP.PG1stQ_rEo3y_TD_a
	, PeersP.PG3stQ_r1m
	, PeersP.PG3stQ_r3m
	, PeersP.PG3stQ_r6m
	, PeersP.PG3stQ_r1y
	, PeersP.PG3stQ_r2y
	, PeersP.PG3stQ_r3y
	, PeersP.PG3stQ_r5y
	, PeersP.PG3stQ_rYtD
	, DYf.[PG3stQ_ry-1]
	, DYf.[PG3stQ_ry-2]
	, DYf.[PG3stQ_ry-3]
	, DYf.[PG3stQ_ry-4]
	, DYf.[PG3stQ_ry-5]
	, PeersP.PG3stQ_rEo2y_TD
	, PeersP.PG3stQ_rEo3y_TD
--	, PeersP.PG3stQ_r_SI
	, PeersP.PG3stQ_r2y_a
	, PeersP.PG3stQ_r3y_a
	, PeersP.PG3stQ_r5y_a
	, PeersP.PG3stQ_rEo2y_TD_a
	, PeersP.PG3stQ_rEo3y_TD_a
	, PeersP.PGavg_r1m
	, PeersP.PGavg_r3m
	, PeersP.PGavg_r6m                                             
	, PeersP.PGavg_r1y                                             
	, PeersP.PGavg_r2y                                             
	, PeersP.PGavg_r3y                                             
	, PeersP.PGavg_r5y                                             
	, PeersP.PGavg_rYtD                                            
	, DYf.[PGavg_ry-1]
	, DYf.[PGavg_ry-2]                                            
	, DYf.[PGavg_ry-3]                                            
	, DYf.[PGavg_ry-4]                                            
	, DYf.[PGavg_ry-5]                                            
	, PeersP.PGavg_rEo2y_TD                                        
	, PeersP.PGavg_rEo3y_TD                                        
	, PeersP.PGavg_r2y_a                                           
	, PeersP.PGavg_r3y_a                                           
	, PeersP.PGavg_r5y_a                                           
	, PeersP.PGavg_rEo2y_TD_a                                      
	, PeersP.PGavg_rEo3y_TD_a                                      
	, PeersP.PGmed_r1m                                             
	, PeersP.PGmed_r3m                                             
	, PeersP.PGmed_r6m                                             
	, PeersP.PGmed_r1y                                             
	, PeersP.PGmed_r2y                                             
	, PeersP.PGmed_r3y                                             
	, PeersP.PGmed_r5y                                             
	, PeersP.PGmed_rYtD                                            
	, DYf.[PGmed_ry-1]                                            
	, DYf.[PGmed_ry-2]                                            
	, DYf.[PGmed_ry-3]                                            
	, DYf.[PGmed_ry-4]                                            
	, DYf.[PGmed_ry-5]                                            
	, PeersP.PGmed_rEo2y_TD                                        
	, PeersP.PGmed_rEo3y_TD                                        
	, PeersP.PGmed_r2y_a                                           
	, PeersP.PGmed_r3y_a                                           
	, PeersP.PGmed_r5y_a                                           
	, PeersP.PGmed_rEo2y_TD_a                                      
	, PeersP.PGmed_rEo3y_TD_a
	, PeersPSI.PeersNo_SI
	, PeersPSI.PG1stQ_r_SI
	, PeersPSI.PG1stQ_r_SI_a
	, PeersPSI.PG3stQ_r_SI
	, PeersPSI.PG3stQ_r_SI_a
	, PeersPSI.PGavg_r_SI
	, PeersPSI.PGavg_r_SI_a
	, PeersPSI.PGmed_r_SI
	, PeersPSI.PGmed_r_SI_a
	, PeersPSI.PGMedStD1y
	, PeersPSI.PGMedStD2y
	, PeersPSI.PGMedStD3y
	, PeersPSI.PGMedStD5y
	, DYf.[PGMedStDy-1]
	, DYf.[PGMedStDy-2]
	, DYf.[PGMedStDy-3]
	, DYf.[PGMedStDy-4]
	, DYf.[PGMedStDy-5]
	, PeersPSI.[PGMedStDEo2y_TD]
	, PeersPSI.[PGMedStDEo3y_TD]
	
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBetaYtD END) AS ProdBetaYtD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBeta1y END) AS ProdBeta1y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBeta2y END) AS ProdBeta2y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBeta3y END) AS ProdBeta3y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBeta5y END) AS ProdBeta5y

	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdBetay-1] END) AS [ProdBetay-1]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdBetay-2] END) AS [ProdBetay-2]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdBetay-3] END) AS [ProdBetay-3]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdBetay-4] END) AS [ProdBetay-4]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdBetay-5] END) AS [ProdBetay-5]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBetaEo2y_TD END) AS ProdBetaEo2y_TD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBetaEo3y_TD END) AS ProdBetaEo3y_TD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdBeta_SI END) AS ProdBeta_SI
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsPSLM.ProdBeta_SLMC END) AS ProdBeta_SLMC
	
	, FundsA.ProdStDYtD
	, FundsA.ProdStD1y
	, FundsA.ProdStD2y
	, FundsA.ProdStD3y
	, FundsA.ProdStD5y
	, DYf.[ProdStDy-1]
	, DYf.[ProdStDy-2]
	, DYf.[ProdStDy-3]
	, DYf.[ProdStDy-4]
	, DYf.[ProdStDy-5]
	, FundsA.ProdStDEo2y_TD
	, FundsA.ProdStDEo3y_TD

	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTEYtD END) AS ProdTEYtD
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTE1y END) AS ProdTE1y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTE2y END) AS ProdTE2y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTE3y END) AS ProdTE3y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTE5y END) AS ProdTE5y
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdTEy-1] END) AS [ProdTEy-1]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdTEy-2] END) AS [ProdTEy-2]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdTEy-3] END) AS [ProdTEy-3]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdTEy-4] END) AS [ProdTEy-4]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdTEy-5] END) AS [ProdTEy-5]
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTEEo2y_TD END) AS ProdTEEo2y_TD
 	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdTEEo3y_TD END) AS ProdTEEo3y_TD

	, FundsA.ProdTER

	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlphaYtD END) AS ProdAlphaYtD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlpha1y END) AS ProdAlpha1y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlpha2y END) AS ProdAlpha2y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlpha3y END) AS ProdAlpha3y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlpha5y END) AS ProdAlpha5y
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdAlphay-1] END) AS [ProdAlphay-1]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdAlphay-2] END) AS [ProdAlphay-2]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdAlphay-3] END) AS [ProdAlphay-3]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdAlphay-4] END) AS [ProdAlphay-4]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE DYf.[ProdAlphay-5] END) AS [ProdAlphay-5]
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlphaEo2y_TD END) AS ProdAlphaEo2y_TD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlphaEo3y_TD END) AS ProdAlphaEo3y_TD
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsA.ProdAlpha_SI END) AS ProdAlpha_SI
	, (CASE WHEN Benchs.IsCash = 1 THEN NULL ELSE FundsPSLM.ProdAlpha_SLMC END) AS ProdAlpha_SLMC

	, IRRank.ProdIR1m
	, IRRank.ProdIR3m
	, IRRank.ProdIR6m
	, IRRank.ProdIRYtD
	, IRRank.ProdIR1y
	, IRRank.ProdIR2y
	, IRRank.ProdIR3y
	, IRRank.ProdIR5y
	, DYf.[ProdIRy-1]
	, DYf.[ProdIRy-2]
	, DYf.[ProdIRy-3]
	, DYf.[ProdIRy-4]
	, DYf.[ProdIRy-5]
	, IRRank.ProdIREo2y_TD
	, IRRank.ProdIREo3y_TD
	, IRRank.ProdIR_SI

	, IRRank.ProdIRRank1m
	, IRRank.ProdIRRank3m
	, IRRank.ProdIRRank6m
	, IRRank.ProdIRRankYtD
	, IRRank.ProdIRRank1y
	, IRRank.ProdIRRank2y
	, IRRank.ProdIRRank3y
	, IRRank.ProdIRRank5y
	, DYf.[ProdIRRanky-1]
	, DYf.[ProdIRRanky-2]
	, DYf.[ProdIRRanky-3]
	, DYf.[ProdIRRanky-4]
	, DYf.[ProdIRRanky-5]
	, IRRank.ProdIRRankEo2y_TD
	, IRRank.ProdIRRankEo3y_TD
	, IRRank.ProdIRRank_SI

	, IRRank.PGIRNum1m
	, IRRank.PGIRNum3m
	, IRRank.PGIRNum6m
	, IRRank.PGIRNumYtD
	, IRRank.PGIRNum1y
	, IRRank.PGIRNum2y
	, IRRank.PGIRNum3y
	, IRRank.PGIRNum5y
	, DYf.[PGIRNumy-1]
	, DYf.[PGIRNumy-2]
	, DYf.[PGIRNumy-3]
	, DYf.[PGIRNumy-4]
	, DYf.[PGIRNumy-5]
	, IRRank.PGIRNumEo2y_TD
	, IRRank.PGIRNumEo3y_TD
	, IRRank.PGIRNum_SI
	, FundsPSLM.NP_SLMC
	, FundsPSLM.NP_SLMC_a
	, FundsPSLM.ProdRank_SLMC
	, PeersPSLM.PeersNo_SLMC
	, PeersPSLM.PG1stQ_r_SLMC
	, PeersPSLM.PG1stQ_r_SLMC_a
	, PeersPSLM.PG3stQ_r_SLMC
	, PeersPSLM.PG3stQ_r_SLMC_a
	, PeersPSLM.PGavg_r_SLMC
	, PeersPSLM.PGavg_r_SLMC_a
	, PeersPSLM.PGmed_r_SLMC
	, PeersPSLM.PGmed_r_SLMC_a
	, BenchsPSLM.Ben_SLMC
	, BenchsPSLM.Ben_SLMC_a


FROM	tbl_Products AS Funds LEFT JOIN
	tbl_Benchmarks AS Benchs ON (
		Funds.BenchmarkId = Benchs.Id
		) LEFT JOIN
	tbl_PeerGroupsDefs AS Peers ON (
		Funds.id = Peers.FundId
		) LEFT JOIN
	tbl_FundsPerfs AS FundP ON (
		Funds.Id = FundP.FundId
		) LEFT JOIN
	tbl_BenchPerfs AS BenchP ON (
		Funds.BenchmarkId = BenchP.BchkId
		AND Funds.BaseCCYiso = BenchP.CCY
		AND BenchP.RefDate = FundP.RefDate
		AND BenchP.BizDate = FundP.BizDate
		) LEFT JOIN 
	tbl_BenchPerfsSI AS BenchPSI ON (
		Funds.BenchmarkId = BenchPSI.BchkId
		AND Funds.BaseCCYiso = BenchPSI.CCY
		AND Funds.InceptionDate = BenchPSI.IncDate
		AND FundP.RefDate = BenchPSI.RefDate
		AND FundP.BizDate = BenchPSI.BizDate
		) LEFT JOIN
	tbl_PeersPerfs AS PeersP ON (
		PeersP.Classification = Peers.CatSelector
		AND PeersP.Sector = (CASE Peers.CatSelector
			WHEN 'MStar' THEN Peers.MStarCat
			WHEN 'IMA' THEN Peers.IMACat
			WHEN 'ABI' THEN Peers.ABICat
			WHEN 'GIF' THEN Peers.GIFCat
			WHEN 'Custom' THEN Peers.CustomCat
			END)
		AND Funds.BaseCCYiso = PeersP.CCY
		AND PeersP.RefDate = FundP.RefDate
		AND PeersP.BizDate = FundP.BizDate
		) LEFT JOIN
	tbl_PeersPerfsSI AS PeersPSI ON (
		PeersPSI.Classification = Peers.CatSelector
		AND PeersPSI.Sector = (CASE Peers.CatSelector
			WHEN 'MStar' THEN Peers.MStarCat
			WHEN 'IMA' THEN Peers.IMACat
			WHEN 'ABI' THEN Peers.ABICat
			WHEN 'GIF' THEN Peers.GIFCat
			WHEN 'Custom' THEN Peers.CustomCat
			END)
		AND Funds.InceptionDate = PeersPSI.InceptionDate
		AND Funds.BaseCCYiso = PeersPSI.CCY
		AND PeersPSI.RefDate = FundP.RefDate
		AND PeersPSI.BizDate = FundP.BizDate
		) LEFT JOIN
	tbl_FundsAnlys AS FundsA ON (
		Funds.Id = FundsA.FundId
		AND FundsA.RefDate = FundP.RefDate
		) LEFT JOIN
	tbl_IRPeerRanking AS IRRank ON (
		Funds.Id = IRRank.FundId
		AND FundsA.RefDate = IRRank.RefDate
		) LEFT JOIN
	vw_AllDYFields AS DYf ON (
		DYf.FundId = Funds.Id
		AND DYf.RefDate = FundP.RefDate
		) LEFT JOIN
	tbl_Desks AS Desks ON (Funds.OurTeam = Desks.Code) LEFT JOIN
	tbl_FundsPerfsSLMC AS FundsPSLM ON (
		Funds.Id = FundsPSLM.FundId
		AND FundP.RefDate = FundsPSLM.RefDate
		) LEFT JOIN
	tbl_BenchPerfsSLMC AS BenchsPSLM ON (
		Funds.BenchmarkId = BenchsPSLM.BchkId
		AND Funds.BaseCCYiso = BenchsPSLM.CCY
		AND Funds.LastPMChange = BenchsPSLM.SLMCDate
		AND FundP.RefDate = BenchsPSLM.RefDate
		AND FundP.BizDate = BenchsPSLM.BizDate
		) LEFT JOIN
	tbl_PeerPerfsSLMC AS PeersPSLM ON (
		PeersPSLM.Classification = Peers.CatSelector
		AND PeersPSLM.Sector = (CASE Peers.CatSelector
			WHEN 'MStar' THEN Peers.MStarCat
			WHEN 'IMA' THEN Peers.IMACat
			WHEN 'ABI' THEN Peers.ABICat
			WHEN 'GIF' THEN Peers.GIFCat
			WHEN 'Custom' THEN Peers.CustomCat
			END)
		AND Funds.LastPMChange = PeersPSLM.SLMCdate
		AND Funds.BaseCCYiso = PeersPSLM.CCY
		AND PeersPSLM.RefDate = FundP.RefDate
		AND PeersPSLM.BizDate = FundP.BizDate
		)


WHERE	FundP.RefDate IS NOT NULL

/*(Funds.SoldAs NOT IN('HF', 'Mandate')
	OR Funds.SoldAs IS NULL)*/

--ORDER BY Funds.Id ASC