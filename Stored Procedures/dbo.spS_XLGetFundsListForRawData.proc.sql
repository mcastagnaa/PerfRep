USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetFundsListForRawData') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetFundsListForRawData
GO

CREATE PROCEDURE dbo.spS_GetFundsListForRawData
	@RefDate	datetime, 
	@Obj		nvarchar(50)	

AS

SET NOCOUNT ON;

----------------------------------------------------------------------------------

SELECT	Funds.ShortCode
	, Funds.Company
	, Funds.SoldAs AS Vehicle
	, Funds.FundName
	, (SELECT CASE 
		WHEN (Peers.CatSelector = 'IMA') 
			AND Funds.SoldAs NOT IN ('UCITS4')
			THEN REPLACE (Funds.MStarCode, 'MEUR:','MEURPTX:')
		ELSE Funds.MStarCode
		END) AS MStarCode
	, '"' + (CASE  WHEN @Obj IS NULL THEN Peers.FactsetCode 
			WHEN @Obj = 'IsraelsenVsPeers' THEN Peers.FctsCodeIR END) + '"' AS PeerCode
	, Funds.InceptionDate
	, Funds.BaseCCYiso
	, Bchmk.FactsetCode AS BchmkCode
	, Funds.Id AS DbId
--	, Peers.CatSelector


FROM	tbl_Products AS Funds LEFT JOIN
	tbl_Benchmarks AS Bchmk ON (
		Funds.BenchmarkId = Bchmk.Id
		) LEFT JOIN
	tbl_PeerGroupsDefs AS Peers ON (
		Funds.Id = Peers.FundId
		)
WHERE	(Funds.SoldAs NOT IN('HF', 'Mandate')
	OR Funds.SoldAs IS NULL)
	AND (Funds.InceptionDate < @RefDate)
	AND ((Funds.CloseDate IS NULL) OR (Funds.CloseDate > @RefDate))
	AND ((@Obj IS NULL) OR (Funds.PrimaryObj = @Obj))
--	AND Peers.FactsetCode is null

ORDER BY 	Funds.Company

----------------------------------------------------------------------------------
GRANT EXECUTE ON dbo.spS_GetFundsListForRawData TO [OMAM\Compliance]