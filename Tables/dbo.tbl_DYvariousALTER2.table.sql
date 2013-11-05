USE PerfRep
GO

--sp_RENAME '[OMAM\Matteoc].tbl_FundsAnlys.ProdTE' , 'ProdTE3y', 'COLUMN'

ALTER TABLE [OMAM\Matteoc].tbl_FundsPerfsDY
ADD 	PGIRNum integer


ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfsDY
DROP COLUMN PGIRNum