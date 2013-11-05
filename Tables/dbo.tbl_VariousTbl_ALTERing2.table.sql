ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
DROP CONSTRAINT aaaaatbl_PeersPerfs_PK
GO

ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ALTER COLUMN BizDate datetime NOT NULL


ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ALTER COLUMN RefDate datetime NOT NULL

DROP INDEX ShortCode ON [OMAM\Matteoc].tbl_PeersPerfs
DROP INDEX PeerId ON [OMAM\Matteoc].tbl_PeersPerfs


ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ALTER COLUMN Classification NvarChar(10) NOT NULL
GO

ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ALTER COLUMN Sector NvarChar(100) NOT NULL
GO

ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ALTER COLUMN CCY NvarChar(3) NOT NULL
GO


ALTER TABLE [OMAM\Matteoc].tbl_PeersPerfs
ADD CONSTRAINT pk_PeersPerfs PRIMARY KEY (Classification, Sector, CCY, RefDate)
GO

