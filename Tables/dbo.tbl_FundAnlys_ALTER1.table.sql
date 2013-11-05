USE PerfRep
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha1m float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha3m float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha6m float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha1y float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha2y float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha3y float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha5y float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlphaYtD float
GO

ALTER TABLE tbl_FundsAnlys
	ADD [ProdAlphay-1] float
GO

ALTER TABLE tbl_FundsAnlys
	ADD [ProdAlphay-2] float
GO

ALTER TABLE tbl_FundsAnlys
	ADD [ProdAlphay-3] float
GO

ALTER TABLE tbl_FundsAnlys
	ADD [ProdAlphay-4] float
GO

ALTER TABLE tbl_FundsAnlys
	ADD [ProdAlphay-5] float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlphaEo2y_TD float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlphaEo3y_TD float
GO

ALTER TABLE tbl_FundsAnlys
	ADD ProdAlpha_SI float
GO