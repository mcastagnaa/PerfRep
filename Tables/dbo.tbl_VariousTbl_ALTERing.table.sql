USE PerfRep
GO

--sp_RENAME '[OMAM\Matteoc].tbl_FundsAnlys.ProdTE' , 'ProdTE3y', 'COLUMN'

ALTER TABLE [OMAM\Matteoc].tbl_FundsAnlys
ADD 	[ProdTE1y] float
	, [ProdTE2y] float
	, [ProdTE5y] float
	, [ProdTEy-1] float
	, [ProdTEy-2] float
	, [ProdTEy-3] float
	, [ProdTEy-4] float
	, [ProdTEy-5] float
	, [ProdTEEo2y_TD] float
	, [ProdTEEo3y_TD] float


ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfsSI
DROP COLUMN Peer_Avg_SD