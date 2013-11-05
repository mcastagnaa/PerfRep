USE PerfRep
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (
	SELECT * FROM dbo.sysobjects 
	WHERE 	id = OBJECT_ID(N'dbo.spS_GetPerfRawData_FundsOnly') AND 
		OBJECTPROPERTY(id,N'IsProcedure') = 1
	)
DROP PROCEDURE dbo.spS_GetPerfRawData_FundsOnly
GO

CREATE PROCEDURE dbo.spS_GetPerfRawData_FundsOnly
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
, InvManager
, OurTeam
, OurPM
, SoldAs
, ISNULL(Classification + '-' + PeerGroup, 'No peer group') AS PeerGroupLabel
, RefDate
, BizDate AS LastBusinessDay
, AuM
, ProdTER
, NP1m/100 AS Net1m
, NP3m/100 AS Net3m
, NP6m/100 AS Net6m
, NP1y/100 AS Net1y
, NP2y/100 AS Net2y
, NP3y/100 AS Net3y
, NP5y/100 AS Net5y
, NPYtD/100 AS NetYtD
, [NPy-1]/100 AS [Nety-1]
, [NPy-2]/100 AS [Nety-2]
, [NPy-3]/100 AS [Nety-3]
, [NPy-4]/100 AS [Nety-4]
, [NPy-5]/100 AS [Nety-5]
, NPEo2y_TD/100 AS NetEo2y_TD
, NPEo3y_TD/100 AS NetEo3y_TD
, NP_SI/100 AS Net_SI
, NP2y_a/100 AS Net2y_pa
, NP3y_a/100 AS Net3y_pa
, NP5y_a/100 AS Net5y_pa
, NPEo2y_TD_a/100 AS NetPEo2y_TD_pa
, NPEo3y_TD_a/100 AS NPEo3y_TD_pa
, NP_SI_a/100 AS NP_SI_pa
/*, ((ProdTER/12 * 1) + NP1m)/100 AS Gross1m
, ((ProdTER/12 * 3) + NP3m)/100 AS Gross3m
, ((ProdTER/12 * 6) + NP6m)/100 AS Gross6m
, (ProdTER + NP1y)/100 AS Gross1y
--, ((POWER(1+ISNULL(ProdTER,1)/100, 3)-1) * 100 + NP3y)/100 AS GP3y
, ((POWER((1 + ProdTER/100), 2) - 1) * 100 + NP2y)/100 AS Gross2y
, ((POWER((1 + ProdTER/100), 3) - 1) * 100 + NP3y)/100 AS Gross3y
, ((POWER((1 + ProdTER/100), 5) - 1) * 100 + NP5y)/100 AS Gross5y
,(ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 1) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/365
	 	+ NPYtD)/100 AS GrossYtD
, (ProdTER + [NPy-1])/100 [Grossy-1]
, (ProdTER + [NPy-2])/100 [Grossy-2]
, (ProdTER + [NPy-3])/100 [Grossy-3]
, (ProdTER + [NPy-4])/100 [Grossy-4]
, (ProdTER + [NPy-5])/100 [Grossy-5]
, (ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 2) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/ 365
	 + NPEo2y_TD)/100 AS GrossEo2y_TD
, (ProdTER * 
	CAST(DATEDIFF(dd, CONVERT(datetime, '12/31/' + CAST((DATEPART(YEAR, RefDate) - 3) AS NVARCHAR(4)), 101)
		, RefDate) AS float)/ 365
	 + NPEo3y_TD)/100 AS GrossEo3y_TD
, (ProdTER * 
	CAST(DATEDIFF(dd, Inception, RefDate) AS float)/ 365
	 + NP_SI)/100 AS Gross_SI
, (ProdTER + NP2y_a)/100 AS Gross2y_a
, (ProdTER + NP3y_a)/100 AS Gross3y_a
, (ProdTER + NP5y_a)/100 AS Gross5y_a
, (ProdTER + NPEo2y_TD_a)/100 AS GrossEo2y_TD_a
, (ProdTER + NPEo3y_TD_a)/100 AS GrossEo3y_TD_a
, (ProdTER + NP_SI_a)/100 AS GrossP_SI_a*/


FROM	vw_AllPerfDataset AS DSet

WHERE	DSet.RefDate = @RefDate
	AND CHARINDEX(DSet.SoldAS, 
		(CASE @SoldAs
			WHEN 1 THEN 
			'_OEIC_NURS_UCITS4_LifePension_'
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

ORDER BY	OurTeam, OurPM, Company, FundName


----------------------------------------------------------------------------------

GO

GRANT EXECUTE ON dbo.spS_GetPerfRawData_FundsOnly TO [OMAM\Compliance]