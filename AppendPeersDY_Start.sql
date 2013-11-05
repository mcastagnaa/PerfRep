USE PerfRep
GO


DECLARE @RefDate datetime
SET @RefDate = '2012 Dec 31'

TRUNCATE TABLE tbl_PeersPerfsDY

INSERT INTO tbl_PeersPerfsDY (	Classification, Sector, CCY, Year, PeersNo
				, Peers1stQ_r, Peers3stQ_r, PeersAvg, PeersMed, PeersMedSD)

	(
	SELECT 	P.Classification
		, P.Sector
		, P.CCY
		, 2011
		, P.[PeersNoy-1]
		, P.[PG1stQ_ry-1]
		, P.[PG3stQ_ry-1]
		, P.[PGAvg_ry-1]
		, P.[PGMed_ry-1]
		, SI.[PGMedStDy-1]
		
	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS SI ON (
				P.Classification = SI.Classification
				AND P.Sector = SI.Sector
				AND P.CCY = SI.CCY
				AND P.RefDate = SI.RefDate
				)
	WHERE	P.RefDate = @RefDate

	UNION 
	SELECT 	P.Classification
		, P.Sector
		, P.CCY
		, 2010
		, P.[PeersNoy-2]
		, P.[PG1stQ_ry-2]
		, P.[PG3stQ_ry-2]
		, P.[PGAvg_ry-2]
		, P.[PGMed_ry-2]
		, SI.[PGMedStDy-2]
		
	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS SI ON (
				P.Classification = SI.Classification
				AND P.Sector = SI.Sector
				AND P.CCY = SI.CCY
				AND P.RefDate = SI.RefDate
				)
	WHERE	P.RefDate = @RefDate
	UNION 
	SELECT 	P.Classification
		, P.Sector
		, P.CCY
		, 2009
		, P.[PeersNoy-3]
		, P.[PG1stQ_ry-3]
		, P.[PG3stQ_ry-3]
		, P.[PGAvg_ry-3]
		, P.[PGMed_ry-3]
		, SI.[PGMedStDy-3]
		
	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS SI ON (
				P.Classification = SI.Classification
				AND P.Sector = SI.Sector
				AND P.CCY = SI.CCY
				AND P.RefDate = SI.RefDate
				)
	WHERE	P.RefDate = @RefDate
	UNION 
	SELECT 	P.Classification
		, P.Sector
		, P.CCY
		, 2008
		, P.[PeersNoy-4]
		, P.[PG1stQ_ry-4]
		, P.[PG3stQ_ry-4]
		, P.[PGAvg_ry-4]
		, P.[PGMed_ry-4]
		, SI.[PGMedStDy-4]
		
	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS SI ON (
				P.Classification = SI.Classification
				AND P.Sector = SI.Sector
				AND P.CCY = SI.CCY
				AND P.RefDate = SI.RefDate
				)
	WHERE	P.RefDate = @RefDate
	UNION 
	SELECT 	P.Classification
		, P.Sector
		, P.CCY
		, 2007
		, P.[PeersNoy-5]
		, P.[PG1stQ_ry-5]
		, P.[PG3stQ_ry-5]
		, P.[PGAvg_ry-5]
		, P.[PGMed_ry-5]
		, SI.[PGMedStDy-5]
		
	FROM	tbl_PeersPerfs AS P LEFT JOIN
			tbl_PeersPerfsSI AS SI ON (
				P.Classification = SI.Classification
				AND P.Sector = SI.Sector
				AND P.CCY = SI.CCY
				AND P.RefDate = SI.RefDate
				)
	WHERE	P.RefDate = @RefDate
	)

UPDATE tbl_PeersPerfsDY
SET RefDate = CAST(CAST(Year AS NVARCHAR(4)) + '/12/31' AS datetime) 