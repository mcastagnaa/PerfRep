USE PerfRep
GO

DROP TABLE tbl_EoMPerfSummary
GO

CREATE TABLE tbl_EoMPerfSummary(
	FundId			integer 	NOT NULL
	, RefDate		datetime	NOT NULL
	, FundName		nvarchar(150)
	, Company		nvarchar(15)
	, SoldAs		nvarchar(100)
	, PrimaryObj		nvarchar(50)
	, IsPeerGroupDefined 	bit
	, PeerGroup		nvarchar(100)
	, IsBenchmarkDefined	bit
	, BenchCode		nvarchar(15)
	, BenchName		nvarchar(100)
	, OurTeam		nvarchar(100)
	, AuMGBP		float
	, AuMWeight		float
	, Quart1m		float
	, Quart3m		float
	, QuartYtD		float
	, Quart1y		float
	, Quart2y		float
	, Quart3y		float
	, Quart5y		float
	, QuartEo2y_TD		float
	, QuartEo3y_TD		float
	, Perc1m		float
	, Perc3m		float
	, PercYtD		float
	, Perc1y		float
	, Perc2y		float                           
	, Perc3y		float
	, Perc5y		float
	, PercEo2y_TD		float
	, PercEo3y_TD		float
	, BenchRP1m		float
	, BenchRP3m		float
	, BenchRPYtD		float
	, BenchRP1y		float
	, BenchRP2ya		float
	, BenchRP3ya		float
	, BenchRP5ya		float
	, BenchRPEo2y_TDa	float
	, BenchRPEo3y_TDa	float

	CONSTRAINT pk_EoMPerfSummary PRIMARY KEY (RefDate, FundId)
)