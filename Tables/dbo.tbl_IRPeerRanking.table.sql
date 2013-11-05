USE PerfRep
GO

DROP TABLE tbl_IRPeerRanking
GO

CREATE TABLE tbl_IRPeerRanking (
RefDate			datetime 	NOT NULL
, BizDate		datetime	NOT NULL
, FundId		integer		NOT NULL
, ProdIR1m 		float
, ProdIRRank1m 		integer
, PGIRNum1m 		integer
, ProdIR3m 		float
, ProdIRRank3m 		integer
, PGIRNum3m 		integer
, ProdIR6m 		float
, ProdIRRank6m 		integer
, PGIRNum6m 		integer
, ProdIR1y 		float
, ProdIRRank1y 		integer
, PGIRNum1y 		integer
, ProdIR2y 		float
, ProdIRRank2y 		integer
, PGIRNum2y 		integer
, ProdIR3y 		float
, ProdIRRank3y 		integer
, PGIRNum3y 		integer
, ProdIR5y 		float
, ProdIRRank5y 		integer
, PGIRNum5y 		integer
, ProdIRYtD 		float
, ProdIRRankYtD 	integer
, PGIRNumYtD 		integer
, [ProdIRy-1] 		float
, [ProdIRRanky-1] 	integer
, [PGIRNumy-1] 		integer
, [ProdIRy-2] 		float
, [ProdIRRanky-2] 	integer
, [PGIRNumy-2] 		integer
, [ProdIRy-3] 		float
, [ProdIRRanky-3] 	integer
, [PGIRNumy-3] 		integer
, [ProdIRy-4] 		float
, [ProdIRRanky-4] 	integer
, [PGIRNumy-4] 		integer
, [ProdIRy-5] 		float
, [ProdIRRanky-5] 	integer
, [PGIRNumy-5] 		integer
, ProdIREo2y_TD 	float
, ProdIRRankEo2y_TD 	integer
, PGIRNumEo2y_TD 	integer
, ProdIREo3y_TD 	float
, ProdIRRankEo3y_TD 	integer
, PGIRNumEo3y_TD 	integer
, ProdIR_SI		float
, ProdIRRank_SI 	integer
, PGIRNum_SI 		integer
CONSTRAINT pk_IRPeerRanking PRIMARY KEY (RefDate, FundId)
)
