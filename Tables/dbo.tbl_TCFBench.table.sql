USE PerfRep
GO

CREATE TABLE tbl_TCFBench (
RefDate			datetime 	NOT NULL
, Item			nvarchar(20) 	NOT NULL
, FundId		integer		NOT NULL
, PrimaryObj		nvarchar(20)
, Company		nvarchar(10)
, OurTeam		nvarchar(20)
, OurPM			nvarchar(20)
, Label1y		nvarchar(100)
, Label3y		nvarchar(100)
, Label5y		nvarchar(100)
, Label5yAbs		nvarchar(100)
, LabelBlend		nvarchar(100)
, FundAndIndex		nvarchar(200)
, Fund1y		float
, Index1y		float
, Test1y		integer
, Fund3y		float
, Index3y		float
, Test3y		integer
, Fund5y		float
, Index5y		float
, Test5y		integer
, Test5yAbs		integer
, BlendRAG		integer
, NonPerfoming1y	integer
, TotalFunds1y		integer
, PercNonPerf1y		float
, LowBound1y		integer
, HiBound1y		integer
, RAGIndex1y		integer
, NonPerfoming3y	integer
, TotalFunds3y		integer
, PercNonPerf3y		float
, LowBound3y		integer
, HiBound3y		integer
, RAGIndex3y		integer
, NonPerfoming5y	integer
, TotalFunds5y		integer
, PercNonPerf5y		float
, LowBound5y		integer
, HiBound5y		integer
, RAGIndex5y		integer
, NonPerfoming5yAbs	integer
, TotalFunds5yAbs	integer
, PercNonPerf5yAbs	float
, LowBound5yAbs		integer
, HiBound5yAbs		integer
, RAGIndex5yAbs		integer
, NonPerfomingBlend	integer
, TotalFundsBlend	integer
, PercNonPerfBlend	float
, LowBoundBlend		integer
, HiBoundBlend		integer
, RAGIndexBlend		integer

CONSTRAINT pk_TCFBench PRIMARY KEY (RefDate, FundId)
)
