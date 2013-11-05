USE PerfRep
GO
ALTER TABLE tbl_Benchmarks
	ADD IsCash bit DEFAULT 0 NOT NULL

GO 
