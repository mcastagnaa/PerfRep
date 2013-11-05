USE PerfRep
GO

DROP TABLE tbl_TCFPeer
GO

CREATE TABLE tbl_TCFPeer (
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
, LabelBlend		nvarchar(100)
, FundAndIndex		nvarchar(200)
, ProdRank1y		integer
, PeersNo1y		integer
, Perc1y		float
, Test1y		integer
, ProdRank3y		integer
, PeersNo3y		integer
, Perc3y		float
, Test3y		integer
, ProdRank5y		integer
, PeersNo5y		integer
, Perc5y		float
, Test5y		integer
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
, NonPerfomingBlend	integer
, TotalFundsBlend	integer
, PercNonPerfBlend	float
, LowBoundBlend		integer
, HiBoundBlend		integer
, RAGIndexBlend		integer

CONSTRAINT pk_TCFPeer PRIMARY KEY (RefDate, FundId)
)
