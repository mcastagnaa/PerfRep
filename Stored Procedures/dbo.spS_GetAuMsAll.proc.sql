USE PerfRep;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetAuMsAll') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetAuMsAll
GO

CREATE PROCEDURE dbo.spS_GetAuMsAll
	@RefDate datetime
AS

DECLARE @PrevDate datetime
		, @LastAuM float
		, @PrevAuM float

SET @PrevDate = (	
		SELECT	MAX(RefDate) 
		FROM 	tbl_FinanceAuM
		WHERE	RefDate < @RefDate
		)

SET NOCOUNT ON;

------------------------------------------------

SELECT	P.OurTeam AS Desk
		, SUM(AuM.AuMGBP) AS AuMGBP
		, AuM.RefDate
INTO	#Last
FROM	tbl_FinanceAuM AS AuM LEFT JOIN
		tbl_Products AS P ON (
			AuM.ShortCode = P.ShortCode
			)
WHERE	RefDate = @RefDate
GROUP BY	P.OurTeam, AuM.RefDate

------------------------------------------------

SELECT	P.OurTeam AS Desk
		, SUM(AuM.AuMGBP) AS AuMGBP
		, AuM.RefDate
INTO	#Prev
FROM	tbl_FinanceAuM AS AuM LEFT JOIN
		tbl_Products AS P ON (
			AuM.ShortCode = P.ShortCode
			)
WHERE	RefDate = @PrevDate
GROUP BY	P.OurTeam, AuM.RefDate

------------------------------------------------

SELECT	P.SoldAs AS SoldAs
		, SUM(AuM.AuMGBP) AS AuMGBP
		, AuM.RefDate
INTO	#LastSA
FROM	tbl_FinanceAuM AS AuM LEFT JOIN
		tbl_Products AS P ON (
			AuM.ShortCode = P.ShortCode
			)
WHERE	RefDate = @RefDate
GROUP BY	P.SoldAs, AuM.RefDate

------------------------------------------------

SELECT	P.SoldAs AS SoldAs
		, SUM(AuM.AuMGBP) AS AuMGBP
		, AuM.RefDate
INTO	#PrevSA
FROM	tbl_FinanceAuM AS AuM LEFT JOIN
		tbl_Products AS P ON (
			AuM.ShortCode = P.ShortCode
			)
WHERE	RefDate = @PrevDate
GROUP BY	P.SoldAs, AuM.RefDate

------------------------------------------------
SET @LastAuM = (SELECT SUM(AuMGBP) FROM #Last)
SET @PrevAuM = (SELECT SUM(AuMGBP) FROM #Prev)
------------------------------------------------

SELECT	'All' AS Desk
		, 'All' AS Product
		, @RefDate AS LastDate
		, @LastAum AS LastAuM
		, @PrevDate AS PrevDate
		, @PrevAuM AS PrevAuM
		, @LastAuM - @PrevAuM AS Diff
		, @LastAuM/@PrevAuM -1 AS DiffPerc
UNION
SELECT	ISNULL(L.Desk, P.Desk) 
		, 'All'
		, L.RefDate
		, L.AuMGBP
		, P.RefDate
		, P.AuMGBP
		, L.AuMGBP - P.AuMGBP
		, L.AuMGBP/P.AuMGBP -1
FROM	#Last AS L FULL JOIN
		#Prev AS P ON (
			L.Desk = P.Desk
			)
UNION
SELECT	'All'
		, ISNULL(L.SoldAs, P.SoldAs) 
		, L.RefDate
		, L.AuMGBP
		, P.RefDate
		, P.AuMGBP
		, L.AuMGBP - P.AuMGBP
		, L.AuMGBP/P.AuMGBP -1
FROM	#LastSA AS L FULL JOIN
		#PrevSA AS P ON (
			L.SoldAs = P.SoldAs
			)

------------------------------------------------
DROP TABLE #Last
DROP TABLE #Prev
DROP TABLE #LastSA
DROP TABLE #PrevSA
------------------------------------------------

GO
GRANT EXECUTE ON dbo.spS_GetAuMsAll TO [OMAM\Compliance]
