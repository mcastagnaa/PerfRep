USE PerfRep
GO

ALTER TABLE [OMAM\Matteoc].tbl_FundsPerfsDY
ADD 	[ProdIR] float
		, [ProdIRRank] integer
	

ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfsDY
ADD 	[PGIRNum] integer

