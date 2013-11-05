USE PerfRep
GO

-- copy the outcome into Performance$\perfReporting\ExcelTools\Utilities\Create....
-- and take column I into the WIKI page

SELECT OurTeam AS Team
		, (CASE OurTeam WHEN 'ExtSStrat' THEN InvManager ELSE ' ' END) AS ExtManager
		, OurPM AS PM
		, ShortCode
		, FundName
		, (CASE SoldAs	WHEN 'UCITS4' THEN 
			'{color:green}Off{color}{color:grey}sh{color}{color:orange}ore{color}' 
						ELSE 
			'{color:blue}Onsho{color}{color:red}re{color}' END)
						AS Domicile
		, IsSelect
FROM tbl_Products
WHERE SoldAs not in ('Mandate', 'HF')
		AND CloseDate is null
		AND InceptionDate < getdate()
ORDER BY OurTeam
		, PM
		, (CASE OurTeam WHEN 'ExtSStrat' THEN InvManager ELSE ' ' END)
		, FundName