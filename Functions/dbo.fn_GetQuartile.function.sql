USE PerfRep
GO

IF EXISTS (
	SELECT 	* 
	FROM   	sys.objects 
	WHERE	type = 'FN' AND 
		name = 'fn_GetQuartile'
	)
DROP FUNCTION [dbo].[fn_GetQuartile]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_GetQuartile]
(
	@percentile float,
	@IsBadNull bit

)
RETURNS integer
AS

BEGIN
	RETURN (CASE 
			WHEN @percentile <= 0.25 THEN 1
			WHEN @percentile <= 0.50 THEN 2
			WHEN @percentile <= 0.75 THEN 3 
			WHEN @percentile <= 1 THEN 4 
			ELSE (CASE @IsBadNull WHEN 1 THEN NULL ELSE 5 END)
		END)
END

GO
