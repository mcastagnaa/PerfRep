USE PerfRep
GO

SELECT P.OurTeam AS Team
		, (CASE P.OurTeam WHEN 'ExtSStrat' THEN InvManager ELSE ' ' END) AS ExtManager
		, P.OurPM AS PM
		, P.ShortCode
		, P.FundName
		, (CASE P.SoldAs	WHEN 'UCITS4' THEN 'Retail OffShore' 
							WHEN 'OEIC' THEN 'Retail Onshore'
							WHEN 'NURS' THEN 'Retail Onshore'
							WHEN 'HF' THEN 'Cayman fund'
						ELSE 'Mandate' END)
				AS Class
		, P.IsSelect
		, P.PrimaryObj
		, (CASE P.PrimaryObj WHEN 'index' THEN 'TRUE' ELSE 'FALSE' END) AS ToBeClarified
		, B.LongName AS ReferenceName
		, (CASE B.IsCash WHEN 1 THEN 'TRUE' ELSE 'FALSE' END) AS ReferenceIsCash

FROM	tbl_Products AS P LEFT JOIN
		tbl_Benchmarks AS B ON (
			P.BenchmarkId = B.id
			)
WHERE	CloseDate is null
		AND InceptionDate < getdate()
ORDER BY IsSelect
		, OurTeam
		, PM
		, (CASE OurTeam WHEN 'ExtSStrat' THEN InvManager ELSE ' ' END)
		, FundName