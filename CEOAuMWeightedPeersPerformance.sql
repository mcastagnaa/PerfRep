USE PerfRep
GO

DECLARE @RefDate datetime
SET @RefDate = '2012 DEC 31'

------------------------------------------------------------------------

SET NOCOUNT ON;

CREATE TABLE #FullSet(
	Id Integer
	,FundName 		nvarchar(150)
	,ShortCode 		Nvarchar(15)
	,Company 		NvarChar(15)
	,BaseCCYIso 		NvarChar(3)
	,Inception 		Datetime
	,BenCode  		NvarChar(15)
	,BenName 		NvarChar(100)
	,PrimaryObj 		NvarChar(50)
	,InvManager 		NvarChar(100)
	,OurTeam 		NvarChar(100)
	,OurPM 			NVarChar(100)
	,OurAnalyst 		NVarChar(100)
	,SoldAs 		NvarChar(100)
	,InAs 			NvarChar(100)
	,IUProduct 		NvarChar(50)
	,Classification 	NvarChar(100)
	,PeerGroup 		NvarChar(100)
	,PeerGroupLabel 	NvarChar(100)
	,RefDate 		Datetime
	,LastBusinessDay 	Datetime
	,AuM 			float
	,ProdTER 		float
	,NP1m 			float
	,NP3m 			float
	,NP6m 			float
	,NP1y 			float
	,NP2y 			float
	,NP3y 			float
	,NP5y 			float
	,NPYtD 			float
	,[NPy-1] 		float
	,[NPy-2] 		float
	,[NPy-3] 		float
	,[NPy-4] 		float
	,[NPy-5] 		float
	,NPEo2y_TD 		float	
	,NPEo3y_TD 		float	
	,NP_SI 			float
	,NP2y_a 		float
	,NP3y_a 		float
	,NP5y_a 		float
	,NPEo2y_TD_a 		float
	,NPEo3y_TD_a 		float
	,NP_SI_a 		float
	,GP1m 			float
	,GP3m 			float
	,GP6m 			float
	,GP1y 			float
	,GP2y 			float
	,GP3y 			float
	,GP5y 			float
	,GPYtD			float
	,[GPy-1] 		float
	,[GPy-2] 		float
	,[GPy-3] 		float
	,[GPy-4] 		float
	,[GPy-5] 		float
	,GPEo2y_TD 		float
	,GPEo3y_TD 		float
	,GP_SI 			float
	,GP2y_a 		float
	,GP3y_a 		float
	,GP5y_a 		float
	,GPEo2y_TD_a 		float
	,GPEo3y_TD_a 		float
	,GP_SI_a 		float
	,ProdRank1m 		float
	,ProdRank3m 		float
	,ProdRank6m 		float
	,ProdRank1y 		float
	,ProdRank2y 		float
	,ProdRank3y 		float
	,ProdRank5y 		float
	,ProdRankYtD 		float
	,[ProdRanky-1] 		float
	,[ProdRanky-2] 		float
	,[ProdRanky-3] 		float
	,[ProdRanky-4] 		float
	,[ProdRanky-5] 		float
	,ProdRankEo2y_TD 	float
	,ProdRankEo3y_TD 	float
	,ProdRank_SI 		float
	,Ben1m 			float
	,Ben3m 			float
	,Ben6m 			float
	,Ben1y 			float
	,Ben2y 			float
	,Ben3y 			float
	,Ben5y 			float
	,BenYtD 		float
	,[Beny-1] 		float
	,[Beny-2] 		float
	,[Beny-3] 		float
	,[Beny-4] 		float
	,[Beny-5] 		float
	,BenEo2y_TD 		float
	,BenEo3y_TD 		float
	,Ben2y_a 		float
	,Ben3y_a 		float
	,Ben5y_a 		float
	,BenEo2y_TD_a 		float
	,BenEo3y_TD_a 		float
	,Ben_SI			float
	,Ben_SI_a 		float
	,PeersNo1m 		float
	,PeersNo3m 		float
	,PeersNo6m 		float
	,PeersNo1y 		float
	,PeersNo2y 		float
	,PeersNo3y 		float
	,PeersNo5y 		float
	,PeersNoYtD 		float
	,[PeersNoy-1] 		float
	,[PeersNoy-2] 		float
	,[PeersNoy-3] 		float
	,[PeersNoy-4] 		float
	,[PeersNoy-5] 		float
	,PeersNoEo2y_TD 	float
	,PeersNoEo3y_TD 	float
	,PeersNo_SI 		float
	,PG1stQ_r1m 		float
	,PG1stQ_r3m 		float
	,PG1stQ_r6m 		float
	,PG1stQ_r1y 		float
	,PG1stQ_r2y 		float
	,PG1stQ_r3y 		float
	,PG1stQ_r5y 		float
	,PG1stQ_rYtD 		float
	,[PG1stQ_ry-1] 		float
	,[PG1stQ_ry-2] 		float
	,[PG1stQ_ry-3]  	float
	,[PG1stQ_ry-4] 		float
	,[PG1stQ_ry-5] 		float
	,PG1stQ_rEo2y_TD 	float
	,PG1stQ_rEo3y_TD 	float
	,PG1stQ_r2y_a	 	float
	,PG1stQ_r3y_a 		float
	,PG1stQ_r5y_a 		float
	,PG1stQ_rEo2y_TD_a 	float
	,PG1stQ_rEo3y_TD_a 	float
	,PG1stQ_r_SI 		float
	,PG1stQ_r_SI_a 		float
	,PG3stQ_r1m 		float
	,PG3stQ_r3m 		float
	,PG3stQ_r6m 		float
	,PG3stQ_r1y 		float
	,PG3stQ_r2y 		float
	,PG3stQ_r3y 		float
	,PG3stQ_r5y 		float
	,PG3stQ_rYtD 		float
	,[PG3stQ_ry-1] 		float
	,[PG3stQ_ry-2] 		float
	,[PG3stQ_ry-3] 		float
	,[PG3stQ_ry-4] 		float
	,[PG3stQ_ry-5] 		float
	,PG3stQ_rEo2y_TD 	float
	,PG3stQ_rEo3y_TD 	float
	,PG3stQ_r2y_a 		float
	,PG3stQ_r3y_a 		float
	,PG3stQ_r5y_a 		float
	,PG3stQ_rEo2y_TD_a 	float
	,PG3stQ_rEo3y_TD_a 	float
	,PG3stQ_r_SI 		float
	,PG3stQ_r_SI_a 		float
	,PGavg_r1m 		float
	,PGavg_r3m 		float
	,PGavg_r6m 		float
	,PGavg_r1y 		float
	,PGavg_r2y 		float
	,PGavg_r3y 		float
	,PGavg_r5y 		float
	,PGavg_rYtD 		float
	,[PGavg_ry-1] 		float
	,[PGavg_ry-2] 		float
	,[PGavg_ry-3] 		float
	,[PGavg_ry-4] 		float
	,[PGavg_ry-5] 		float
	,PGavg_rEo2y_TD 	float
	,PGavg_rEo3y_TD 	float
	,PGavg_r2y_a 		float
	,PGavg_r3y_a 		float
	,PGavg_r5y_a 		float
	,PGavg_rEo2y_TD_a 	float
	,PGavg_rEo3y_TD_a 	float
	,PGavg_r_SI 		float
	,PGavg_r_SI_a 		float
	,PGmed_r1m 		float
	,PGmed_r3m 		float
	,PGmed_r6m 		float
	,PGmed_r1y 		float
	,PGmed_r2y 		float
	,PGmed_r3y 		float
	,PGmed_r5y 		float
	,PGmed_rYtD 		float
	,[PGmed_ry-1] 		float
	,[PGmed_ry-2] 		float
	,[PGmed_ry-3] 		float
	,[PGmed_ry-4] 		float
	,[PGmed_ry-5] 		float
	,PGmed_rEo2y_TD 	float
	,PGmed_rEo3y_TD 	float
	,PGmed_r2y_a 		float
	,PGmed_r3y_a 		float
	,PGmed_r5y_a 		float
	,PGmed_rEo2y_TD_a	float
	,PGmed_rEo3y_TD_a	float
	,PGmed_r_SI		float
	,PGmed_r_SI_a		float
)

-------------------------------------------------------------------

INSERT INTO #FullSet
EXEC dbo.spS_GetPerfRawData @RefDate, 1, null, null

-------------------------------------------------------------------

SELECT	FS.Id AS FundId
	, FS.Company
	, FS.OurTeam
	, FS.FundName 
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank1m AS float)/FS.PeersNo1m, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank1m AS float)/VW.PGIRNum1m, 1)
			END) AS Quart1m
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank3m AS float)/FS.PeersNo3m, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank3m AS float)/VW.PGIRNum3m, 1)
			END)  AS Quart3m
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRankYtD AS float)/FS.PeersNoYtD, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRankYtD AS float)/VW.PGIRNumYtD, 1)
			END)  AS QuartYtD
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank1y AS float)/FS.PeersNo1y, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank1y AS float)/VW.PGIRNum1y, 1)
			END) AS Quart1y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank2y AS float)/FS.PeersNo2y, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank2y AS float)/VW.PGIRNum2y, 1)
			END) AS Quart2y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank3y AS float)/FS.PeersNo3y, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank3y AS float)/VW.PGIRNum3y, 1)
			END) AS Quart3y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRank5y AS float)/FS.PeersNo5y, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRank5y AS float)/VW.PGIRNum5y, 1)
			END) AS Quart5y
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRankEo2y_TD AS float)/FS.PeersNoEo2y_TD, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRankEo2y_TD AS float)/VW.PGIRNumEo2y_TD, 1)
			END) AS QuartEo2y_TD
	, (CASE WHEN FS.PeerGroup IS NOT NULL THEN
		dbo.fn_GetQuartile(CAST(FS.ProdRankEo3y_TD AS float)/FS.PeersNoEo3y_TD, 1)
		WHEN FS.PrimaryObj = 'IsraelsenVsPeers' THEN 
		dbo.fn_GetQuartile(CAST(VW.ProdIRRankEo3y_TD AS float)/VW.PGIRNumEo3y_TD, 1)
			END) AS QuartEo3y_TD

INTO	#Quartiles
	
FROM 	#FullSet AS FS LEFT JOIN
	[OMAM\Matteoc].vw_AllPerfDataset AS VW ON (
		FS.Id = VW.Id
		AND FS.RefDate = vw.RefDate
		)

WHERE	(FS.PeerGroup IS NOT NULL) OR (FS.PrimaryObj = 'IsraelsenVsPeers')

--------------------------------------------------

SELECT Funds.Id
	, Funds.FundName
	, Funds.Company
	, Funds.SoldAs
	, Funds.PrimaryObj
	, (CASE WHEN Peers.CatSelector IS NULL THEN 'FALSE'
		ELSE 'TRUE' END) AS IsPeerGroupDefined
	, Peers.CatSelector AS PeerGroup
	, Funds.OurTeam
	, AuM.AuMGBP

INTO	#FundsDets

FROM	tbl_Products AS Funds LEFT JOIN
	tbl_PeerGroupsDefs AS Peers ON (
		Peers.FundId = Funds.Id
		) LEFT JOIN
	[OMAM\Matteoc].tbl_FinanceAuM AS AuM ON (
		Funds.FinanceName = AuM.FinanceName
		AND Funds.Company = AuM.Company
		)

WHERE	SoldAs NOT IN ('HF', 'Mandate')
	AND AuM.RefDate = @RefDate

--------------------------------------------------

DECLARE @TotAuM float
SET @TotAuM = (SELECT SUM(AuMGBP) FROM #FundsDets)

--------------------------------------------------

SELECT	Dets.Id AS FundId
	, Dets.FundName
	, Dets.Company
	, Dets.SoldAs
	, Dets.PrimaryObj
	, Dets.IsPeerGroupDefined
	, Dets.PeerGroup
	, Dets.OurTeam
	, Dets.AuMGBP
	, Dets.AuMGBP/@TotAuM AS AuMWeight
	, Q.Quart3m
	, Q.QuartYtD
	, Q.Quart1y
	, Q.Quart2y
	, Q.Quart3y
	, Q.Quart5y
	, Q.QuartEo2y_TD
	, Q.QuartEo3y_TD

FROM	#FundsDets AS Dets LEFT JOIN 
	#Quartiles AS Q ON (
		Dets.Id = Q.FundId
	)

ORDER BY Dets.Id

--------------------------------------------------

DROP TABLE #FullSet
DROP TABLE #Quartiles
DROP TABLE #FundsDets