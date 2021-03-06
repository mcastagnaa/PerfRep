SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CompDefs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_CompDefs](
	[FundId] [smallint] NOT NULL,
	[CompId] [int] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[CompName] [nvarchar](100) NULL,
	[CompOldISIN] [nvarchar](15) NULL,
	[CompOldMStar] [nvarchar](50) NULL,
	[CompRefISIN] [nvarchar](15) NULL,
	[CompRefMStar] [nvarchar](50) NULL,
 CONSTRAINT [aaaaatbl_CompDefs_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC,
	[CompId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PeerGroupsDefs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PeerGroupsDefs](
	[FundId] [int] NOT NULL DEFAULT ((0)),
	[FundName] [nvarchar](100) NULL,
	[MStarCat] [nvarchar](50) NULL,
	[GIFCat] [nvarchar](50) NULL,
	[IMACat] [nvarchar](50) NULL,
	[ABICat] [nvarchar](50) NULL,
	[CustomCat] [nvarchar](50) NULL,
	[CatSelector] [nvarchar](50) NULL,
	[FactsetCode] [nvarchar](255) NULL,
	[FctsCodeIR] [nvarchar](255) NULL,
	[FileName] [nvarchar](25) NULL,
 CONSTRAINT [aaaaatbl_PeerGroupsDefs_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'裏츢埳䫡㡨냡샇' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'FundId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'FundId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundId'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4605' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'뉆꣺䴡䰊톅甡훐얲' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'FundName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'100' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'FundName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'瞰砩㴄䋷㒖₼ि' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MStarCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MStarCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'MStarCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'왝�䵸늞䉟惟䛘' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'GIFCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'GIFCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'GIFCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'檠▵ⵓ䴑슱ᏺﺪ䄊' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IMACat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IMACat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'IMACat'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'栔힔叴䭗㲫⊕툘' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ABICat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ABICat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'ABICat'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'뱯焙있䱘⒬呃֗ᅀ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CustomCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CustomCat' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CustomCat'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'偻耥聲䴵肝烮䜔欭' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CatSelector' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CatSelector' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs', @level2type=N'COLUMN', @level2name=N'CatSelector'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'20/09/2012 08:12:44' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'20/09/2012 08:12:45' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'tbl_PeerGroupsDefs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'100' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_PeerGroupsDefs'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SectorDataStIn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_SectorDataStIn](
	[FundName] [nvarchar](100) NULL,
	[ISIN] [nvarchar](15) NOT NULL,
	[NCCF1m] [float] NULL,
	[NCCF3m] [float] NULL,
	[Perf1y] [float] NULL,
	[Perf3y] [float] NULL,
	[StDev1y] [float] NULL,
	[StDev3y] [float] NULL,
	[RefDate] [datetime] NULL,
	[FileName] [nvarchar](20) NULL,
 CONSTRAINT [aaaaatbl_SectorDataStIn_PK] PRIMARY KEY NONCLUSTERED 
(
	[ISIN] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_benchmarks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_benchmarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](15) NULL,
	[LongName] [nvarchar](100) NULL,
	[Source] [nvarchar](50) NULL,
	[IsHedged] [bit] NOT NULL DEFAULT ((0)),
	[HaveConstituents] [bit] NOT NULL DEFAULT ((0)),
	[IsTR] [bit] NOT NULL DEFAULT ((0)),
	[FactsetCode] [nvarchar](50) NULL,
	[WhatConstituents] [nvarchar](50) NULL,
	[IsCustom] [bit] NOT NULL DEFAULT ((0)),
	[Composition] [ntext] NULL,
	[Note] [ntext] NULL,
	[IsCash] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_benchmarks_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꗸ䕍殰맴뭥譊' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'눓잤境䈬溞⧭鵽颇' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Code' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Code' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Code'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4830' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'洜贻ፕ䝒�碙회⟐' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'LongName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'100' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'LongName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'LongName'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'咢ⱶ䘂冝s铠墔' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Source' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Source' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Source'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'橱殼䕤䊞讒䝆嗹畛' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsHedged' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsHedged' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsHedged'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ྙＡ獕䉵꾳ᔛ譗타' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HaveConstituents' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HaveConstituents' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'HaveConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�栽Ⓛ䋳꾃埛ⶇ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsTR' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsTR' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsTR'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⎜唊䧋傒紸況蘾' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'FactsetCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'FactsetCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'FactsetCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⪆롄腽䣈쒊뚦挱' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WhatConstituents' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'WhatConstituents' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'WhatConstituents'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'沶浧샹䅣Ɣᮑ౎鄪' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsCustom' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsCustom' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'IsCustom'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䫩㛳䂒撚峛嶚住' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Composition' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Composition' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Composition'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鶺೗퓁䧣謁蠵筋즒' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Note' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Note' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks', @level2type=N'COLUMN', @level2name=N'Note'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'20/09/2012 08:12:44' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'20/09/2012 08:12:45' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'tbl_benchmarks' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'130' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_benchmarks'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TCFBench]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TCFBench](
	[RefDate] [datetime] NOT NULL,
	[Item] [nvarchar](20) NOT NULL,
	[FundId] [int] NOT NULL,
	[PrimaryObj] [nvarchar](20) NULL,
	[Company] [nvarchar](10) NULL,
	[OurTeam] [nvarchar](20) NULL,
	[OurPM] [nvarchar](20) NULL,
	[Label1y] [nvarchar](100) NULL,
	[Label3y] [nvarchar](100) NULL,
	[Label5y] [nvarchar](100) NULL,
	[Label5yAbs] [nvarchar](100) NULL,
	[LabelBlend] [nvarchar](100) NULL,
	[FundAndIndex] [nvarchar](200) NULL,
	[Fund1y] [float] NULL,
	[Index1y] [float] NULL,
	[Test1y] [int] NULL,
	[Fund3y] [float] NULL,
	[Index3y] [float] NULL,
	[Test3y] [int] NULL,
	[Fund5y] [float] NULL,
	[Index5y] [float] NULL,
	[Test5y] [int] NULL,
	[Test5yAbs] [int] NULL,
	[BlendRAG] [int] NULL,
	[NonPerfoming1y] [int] NULL,
	[TotalFunds1y] [int] NULL,
	[PercNonPerf1y] [float] NULL,
	[LowBound1y] [int] NULL,
	[HiBound1y] [int] NULL,
	[RAGIndex1y] [int] NULL,
	[NonPerfoming3y] [int] NULL,
	[TotalFunds3y] [int] NULL,
	[PercNonPerf3y] [float] NULL,
	[LowBound3y] [int] NULL,
	[HiBound3y] [int] NULL,
	[RAGIndex3y] [int] NULL,
	[NonPerfoming5y] [int] NULL,
	[TotalFunds5y] [int] NULL,
	[PercNonPerf5y] [float] NULL,
	[LowBound5y] [int] NULL,
	[HiBound5y] [int] NULL,
	[RAGIndex5y] [int] NULL,
	[NonPerfoming5yAbs] [int] NULL,
	[TotalFunds5yAbs] [int] NULL,
	[PercNonPerf5yAbs] [float] NULL,
	[LowBound5yAbs] [int] NULL,
	[HiBound5yAbs] [int] NULL,
	[RAGIndex5yAbs] [int] NULL,
	[NonPerfomingBlend] [int] NULL,
	[TotalFundsBlend] [int] NULL,
	[PercNonPerfBlend] [float] NULL,
	[LowBoundBlend] [int] NULL,
	[HiBoundBlend] [int] NULL,
	[RAGIndexBlend] [int] NULL,
 CONSTRAINT [pk_TCFBench] PRIMARY KEY CLUSTERED 
(
	[RefDate] ASC,
	[FundId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_NCCFPerf]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_NCCFPerf](
	[Item] [nvarchar](10) NOT NULL,
	[FundId] [smallint] NOT NULL,
	[CompId] [smallint] NOT NULL,
	[FundName] [nvarchar](100) NULL,
	[ISIN] [nvarchar](15) NOT NULL,
	[NCCF1m] [float] NULL,
	[NCCF3m] [float] NULL,
	[Perf1y] [float] NULL,
	[Perf3y] [float] NULL,
	[StDev1y] [float] NULL,
	[StDev3y] [float] NULL,
	[RefDate] [datetime] NOT NULL,
	[FileName] [nvarchar](20) NOT NULL,
	[Classification] [nvarchar](10) NULL,
	[Sector] [nvarchar](50) NULL,
 CONSTRAINT [aaaaatbl_NCCFPerf_PK] PRIMARY KEY NONCLUSTERED 
(
	[Item] ASC,
	[FundId] ASC,
	[CompId] ASC,
	[ISIN] ASC,
	[RefDate] ASC,
	[FileName] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SChartsRawData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_SChartsRawData](
	[Ctry] [nvarchar](255) NULL,
	[Class] [nvarchar](255) NULL,
	[RefDate] [datetime] NOT NULL,
	[FundId] [nvarchar](255) NOT NULL,
	[FundName] [nvarchar](255) NULL,
	[MstarCategory] [nvarchar](255) NULL,
	[ISIN] [nvarchar](255) NULL,
	[IM] [nvarchar](255) NULL,
	[IsFoF] [int] NULL,
	[YtDCum] [float] NULL,
	[1yr] [float] NULL,
	[End2yTD] [float] NULL,
	[2yCum] [float] NULL,
	[3yCum] [float] NULL,
	[MgmFees] [float] NULL,
	[NER] [float] NULL,
	[End3yTD] [float] NULL,
	[5yCum] [float] NULL,
 CONSTRAINT [pk_SChartsRawData] PRIMARY KEY CLUSTERED 
(
	[FundId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SRRIcategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_SRRIcategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[LongName] [nvarchar](100) NULL,
 CONSTRAINT [aaaaatbl_SRRIcategories_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IRPeerRanking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_IRPeerRanking](
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NOT NULL,
	[FundId] [int] NOT NULL,
	[ProdIR1m] [float] NULL,
	[ProdIRRank1m] [int] NULL,
	[PGIRNum1m] [int] NULL,
	[ProdIR3m] [float] NULL,
	[ProdIRRank3m] [int] NULL,
	[PGIRNum3m] [int] NULL,
	[ProdIR6m] [float] NULL,
	[ProdIRRank6m] [int] NULL,
	[PGIRNum6m] [int] NULL,
	[ProdIR1y] [float] NULL,
	[ProdIRRank1y] [int] NULL,
	[PGIRNum1y] [int] NULL,
	[ProdIR2y] [float] NULL,
	[ProdIRRank2y] [int] NULL,
	[PGIRNum2y] [int] NULL,
	[ProdIR3y] [float] NULL,
	[ProdIRRank3y] [int] NULL,
	[PGIRNum3y] [int] NULL,
	[ProdIR5y] [float] NULL,
	[ProdIRRank5y] [int] NULL,
	[PGIRNum5y] [int] NULL,
	[ProdIRYtD] [float] NULL,
	[ProdIRRankYtD] [int] NULL,
	[PGIRNumYtD] [int] NULL,
	[ProdIRy-1] [float] NULL,
	[ProdIRRanky-1] [int] NULL,
	[PGIRNumy-1] [int] NULL,
	[ProdIRy-2] [float] NULL,
	[ProdIRRanky-2] [int] NULL,
	[PGIRNumy-2] [int] NULL,
	[ProdIRy-3] [float] NULL,
	[ProdIRRanky-3] [int] NULL,
	[PGIRNumy-3] [int] NULL,
	[ProdIRy-4] [float] NULL,
	[ProdIRRanky-4] [int] NULL,
	[PGIRNumy-4] [int] NULL,
	[ProdIRy-5] [float] NULL,
	[ProdIRRanky-5] [int] NULL,
	[PGIRNumy-5] [int] NULL,
	[ProdIREo2y_TD] [float] NULL,
	[ProdIRRankEo2y_TD] [int] NULL,
	[PGIRNumEo2y_TD] [int] NULL,
	[ProdIREo3y_TD] [float] NULL,
	[ProdIRRankEo3y_TD] [int] NULL,
	[PGIRNumEo3y_TD] [int] NULL,
	[ProdIR_SI] [float] NULL,
	[ProdIRRank_SI] [int] NULL,
	[PGIRNum_SI] [int] NULL,
 CONSTRAINT [pk_IRPeerRanking] PRIMARY KEY CLUSTERED 
(
	[RefDate] ASC,
	[FundId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PeersPerfsSI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PeersPerfsSI](
	[Classification] [nvarchar](10) NOT NULL,
	[Sector] [nvarchar](100) NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[InceptionDate] [datetime] NOT NULL,
	[PeerId] [nvarchar](255) NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NOT NULL,
	[PeersNo_SI] [int] NULL,
	[PG1stQ_r_SI] [float] NULL,
	[PG1stQ_r_SI_a] [float] NULL,
	[PG3stQ_r_SI] [float] NULL,
	[PG3stQ_r_SI_a] [float] NULL,
	[PGavg_r_SI] [float] NULL,
	[PGavg_r_SI_a] [float] NULL,
	[PGmed_r_SI] [float] NULL,
	[PGmed_r_SI_a] [float] NULL,
	[PGMedStD3y] [float] NULL,
	[PGMedStD1y] [float] NULL,
	[PGMedStD2y] [float] NULL,
	[PGMedStD5y] [float] NULL,
	[PGMedStDy-1] [float] NULL,
	[PGMedStDy-2] [float] NULL,
	[PGMedStDy-3] [float] NULL,
	[PGMedStDy-4] [float] NULL,
	[PGMedStDy-5] [float] NULL,
	[PGMedStDEo2y_TD] [float] NULL,
	[PGMedStDEo3y_TD] [float] NULL,
 CONSTRAINT [pk_PeersPerfsSI] PRIMARY KEY CLUSTERED 
(
	[Classification] ASC,
	[Sector] ASC,
	[CCY] ASC,
	[InceptionDate] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PeersPerfs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PeersPerfs](
	[Classification] [nvarchar](10) NOT NULL,
	[Sector] [nvarchar](100) NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[PeerId] [nvarchar](255) NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NOT NULL,
	[PeersNo1m] [int] NULL,
	[PeersNo3m] [int] NULL,
	[PeersNo6m] [int] NULL,
	[PeersNo1y] [int] NULL,
	[PeersNo2y] [int] NULL,
	[PeersNo3y] [int] NULL,
	[PeersNo5y] [int] NULL,
	[PeersNoYtD] [int] NULL,
	[PeersNoy-1] [int] NULL,
	[PeersNoy-2] [int] NULL,
	[PeersNoy-3] [int] NULL,
	[PeersNoy-4] [int] NULL,
	[PeersNoy-5] [int] NULL,
	[PeersNoEo2y_TD] [int] NULL,
	[PeersNoEo3y_TD] [int] NULL,
	[PG1stQ_r1m] [float] NULL,
	[PG1stQ_r3m] [float] NULL,
	[PG1stQ_r6m] [float] NULL,
	[PG1stQ_r1y] [float] NULL,
	[PG1stQ_r2y] [float] NULL,
	[PG1stQ_r3y] [float] NULL,
	[PG1stQ_r5y] [float] NULL,
	[PG1stQ_rYtD] [float] NULL,
	[PG1stQ_ry-1] [float] NULL,
	[PG1stQ_ry-2] [float] NULL,
	[PG1stQ_ry-3] [float] NULL,
	[PG1stQ_ry-4] [float] NULL,
	[PG1stQ_ry-5] [float] NULL,
	[PG1stQ_rEo2y_TD] [float] NULL,
	[PG1stQ_rEo3y_TD] [float] NULL,
	[PG1stQ_r2y_a] [float] NULL,
	[PG1stQ_r3y_a] [float] NULL,
	[PG1stQ_r5y_a] [float] NULL,
	[PG1stQ_rEo2y_TD_a] [float] NULL,
	[PG1stQ_rEo3y_TD_a] [float] NULL,
	[PG3stQ_r1m] [float] NULL,
	[PG3stQ_r3m] [float] NULL,
	[PG3stQ_r6m] [float] NULL,
	[PG3stQ_r1y] [float] NULL,
	[PG3stQ_r2y] [float] NULL,
	[PG3stQ_r3y] [float] NULL,
	[PG3stQ_r5y] [float] NULL,
	[PG3stQ_rYtD] [float] NULL,
	[PG3stQ_ry-1] [float] NULL,
	[PG3stQ_ry-2] [float] NULL,
	[PG3stQ_ry-3] [float] NULL,
	[PG3stQ_ry-4] [float] NULL,
	[PG3stQ_ry-5] [float] NULL,
	[PG3stQ_rEo2y_TD] [float] NULL,
	[PG3stQ_rEo3y_TD] [float] NULL,
	[PG3stQ_r_SI] [float] NULL,
	[PG3stQ_r2y_a] [float] NULL,
	[PG3stQ_r3y_a] [float] NULL,
	[PG3stQ_r5y_a] [float] NULL,
	[PG3stQ_rEo2y_TD_a] [float] NULL,
	[PG3stQ_rEo3y_TD_a] [float] NULL,
	[PGavg_r1m] [float] NULL,
	[PGavg_r3m] [float] NULL,
	[PGavg_r6m] [float] NULL,
	[PGavg_r1y] [float] NULL,
	[PGavg_r2y] [float] NULL,
	[PGavg_r3y] [float] NULL,
	[PGavg_r5y] [float] NULL,
	[PGavg_rYtD] [float] NULL,
	[PGavg_ry-1] [float] NULL,
	[PGavg_ry-2] [float] NULL,
	[PGavg_ry-3] [float] NULL,
	[PGavg_ry-4] [float] NULL,
	[PGavg_ry-5] [float] NULL,
	[PGavg_rEo2y_TD] [float] NULL,
	[PGavg_rEo3y_TD] [float] NULL,
	[PGavg_r2y_a] [float] NULL,
	[PGavg_r3y_a] [float] NULL,
	[PGavg_r5y_a] [float] NULL,
	[PGavg_rEo2y_TD_a] [float] NULL,
	[PGavg_rEo3y_TD_a] [float] NULL,
	[PGmed_r1m] [float] NULL,
	[PGmed_r3m] [float] NULL,
	[PGmed_r6m] [float] NULL,
	[PGmed_r1y] [float] NULL,
	[PGmed_r2y] [float] NULL,
	[PGmed_r3y] [float] NULL,
	[PGmed_r5y] [float] NULL,
	[PGmed_rYtD] [float] NULL,
	[PGmed_ry-1] [float] NULL,
	[PGmed_ry-2] [float] NULL,
	[PGmed_ry-3] [float] NULL,
	[PGmed_ry-4] [float] NULL,
	[PGmed_ry-5] [float] NULL,
	[PGmed_rEo2y_TD] [float] NULL,
	[PGmed_rEo3y_TD] [float] NULL,
	[PGmed_r2y_a] [float] NULL,
	[PGmed_r3y_a] [float] NULL,
	[PGmed_r5y_a] [float] NULL,
	[PGmed_rEo2y_TD_a] [float] NULL,
	[PGmed_rEo3y_TD_a] [float] NULL,
 CONSTRAINT [pk_PeersPerfs] PRIMARY KEY CLUSTERED 
(
	[Classification] ASC,
	[Sector] ASC,
	[CCY] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EoMPerfSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_EoMPerfSummary](
	[FundId] [int] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[FundName] [nvarchar](150) NULL,
	[Company] [nvarchar](15) NULL,
	[SoldAs] [nvarchar](100) NULL,
	[PrimaryObj] [nvarchar](50) NULL,
	[IsPeerGroupDefined] [bit] NULL,
	[PeerGroup] [nvarchar](100) NULL,
	[IsBenchmarkDefined] [bit] NULL,
	[BenchCode] [nvarchar](15) NULL,
	[BenchName] [nvarchar](100) NULL,
	[OurTeam] [nvarchar](100) NULL,
	[AuMGBP] [float] NULL,
	[AuMWeight] [float] NULL,
	[Quart1m] [int] NULL,
	[Quart3m] [int] NULL,
	[QuartYtD] [int] NULL,
	[Quart1y] [int] NULL,
	[Quart2y] [int] NULL,
	[Quart3y] [int] NULL,
	[Quart5y] [int] NULL,
	[QuartEo2y_TD] [int] NULL,
	[QuartEo3y_TD] [int] NULL,
	[Perc1m] [float] NULL,
	[Perc3m] [float] NULL,
	[PercYtD] [float] NULL,
	[Perc1y] [float] NULL,
	[Perc2y] [float] NULL,
	[Perc3y] [float] NULL,
	[Perc5y] [float] NULL,
	[PercEo2y_TD] [float] NULL,
	[PercEo3y_TD] [float] NULL,
	[BenchRP1m] [float] NULL,
	[BenchRP3m] [float] NULL,
	[BenchRPYtD] [float] NULL,
	[BenchRP1y] [float] NULL,
	[BenchRP2ya] [float] NULL,
	[BenchRP3ya] [float] NULL,
	[BenchRP5ya] [float] NULL,
	[BenchRPEo2y_TDa] [float] NULL,
	[BenchRPEo3y_TDa] [float] NULL,
 CONSTRAINT [pk_EoMPerfSummary] PRIMARY KEY CLUSTERED 
(
	[RefDate] ASC,
	[FundId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FundsPerfs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FundsPerfs](
	[FundId] [float] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[NP1m] [float] NULL,
	[NP3m] [float] NULL,
	[NP6m] [float] NULL,
	[NP1y] [float] NULL,
	[NP2y] [float] NULL,
	[NP3y] [float] NULL,
	[NP5y] [float] NULL,
	[NPYtD] [float] NULL,
	[NPy-1] [float] NULL,
	[NPy-2] [float] NULL,
	[NPy-3] [float] NULL,
	[NPy-4] [float] NULL,
	[NPy-5] [float] NULL,
	[NPEo2y_TD] [float] NULL,
	[NPEo3y_TD] [float] NULL,
	[NP_SI] [float] NULL,
	[NP2y_a] [float] NULL,
	[NP3y_a] [float] NULL,
	[NP5y_a] [float] NULL,
	[NPEo2y_TD_a] [float] NULL,
	[NPEo3y_TD_a] [float] NULL,
	[NP_SI_a] [float] NULL,
	[AuM] [float] NULL,
	[ProdRank1m] [int] NULL DEFAULT ((0)),
	[ProdRank3m] [int] NULL DEFAULT ((0)),
	[ProdRank6m] [int] NULL DEFAULT ((0)),
	[ProdRank1y] [int] NULL DEFAULT ((0)),
	[ProdRank2y] [int] NULL DEFAULT ((0)),
	[ProdRank3y] [int] NULL DEFAULT ((0)),
	[ProdRank5y] [int] NULL DEFAULT ((0)),
	[ProdRankYtD] [int] NULL DEFAULT ((0)),
	[ProdRanky-1] [int] NULL DEFAULT ((0)),
	[ProdRanky-2] [int] NULL DEFAULT ((0)),
	[ProdRanky-3] [int] NULL DEFAULT ((0)),
	[ProdRanky-4] [int] NULL DEFAULT ((0)),
	[ProdRanky-5] [int] NULL DEFAULT ((0)),
	[ProdRankEo2y_TD] [int] NULL DEFAULT ((0)),
	[ProdRankEo3y_TD] [int] NULL DEFAULT ((0)),
	[ProdRank_SI] [int] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_FundsPerfs_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FundsAnlys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FundsAnlys](
	[FundId] [float] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[ProdBeta1y] [float] NULL,
	[ProdBeta2y] [float] NULL,
	[ProdBeta3y] [float] NULL,
	[ProdBeta5y] [float] NULL,
	[ProdBetay-1] [float] NULL,
	[ProdBetay-2] [float] NULL,
	[ProdBetay-3] [float] NULL,
	[ProdBetay-4] [float] NULL,
	[ProdBetay-5] [float] NULL,
	[ProdBetaEo2y_TD] [float] NULL,
	[ProdBetaEo3y_TD] [float] NULL,
	[ProdBeta_SI] [float] NULL,
	[ProdStD3y] [float] NULL,
	[ProdTE3y] [float] NULL,
	[ProdTER] [float] NULL,
	[ProdAlpha1y] [float] NULL,
	[ProdAlpha2y] [float] NULL,
	[ProdAlpha3y] [float] NULL,
	[ProdAlpha5y] [float] NULL,
	[ProdAlphay-1] [float] NULL,
	[ProdAlphay-2] [float] NULL,
	[ProdAlphay-3] [float] NULL,
	[ProdAlphay-4] [float] NULL,
	[ProdAlphay-5] [float] NULL,
	[ProdAlphaEo2y_TD] [float] NULL,
	[ProdAlphaEo3y_TD] [float] NULL,
	[ProdAlpha_SI] [float] NULL,
	[ProdStD1y] [float] NULL,
	[ProdStD2y] [float] NULL,
	[ProdStDy-2] [float] NULL,
	[ProdStDy-3] [float] NULL,
	[ProdStDy-4] [float] NULL,
	[ProdStDy-5] [float] NULL,
	[ProdStDEo2y_TD] [float] NULL,
	[ProdStDEo3y_TD] [float] NULL,
	[ProdStD5y] [float] NULL,
	[ProdStDy-1] [float] NULL,
	[ProdTE1y] [float] NULL,
	[ProdTE2y] [float] NULL,
	[ProdTE5y] [float] NULL,
	[ProdTEy-1] [float] NULL,
	[ProdTEy-2] [float] NULL,
	[ProdTEy-3] [float] NULL,
	[ProdTEy-4] [float] NULL,
	[ProdTEy-5] [float] NULL,
	[ProdTEEo2y_TD] [float] NULL,
	[ProdTEEo3y_TD] [float] NULL,
	[ProdAlphaYtD] [float] NULL,
	[ProdBetaYtD] [float] NULL,
	[ProdStDYtD] [float] NULL,
	[ProdTEYtD] [float] NULL,
 CONSTRAINT [aaaaatbl_FundsAnlys_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublicId] [nvarchar](255) NULL,
	[ShortCode] [nvarchar](20) NULL,
	[FundName] [nvarchar](255) NULL,
	[InvManager] [nvarchar](255) NULL,
	[MStarCode] [nvarchar](255) NULL,
	[MStarSPID] [int] NULL CONSTRAINT [DF__tbl_Produ__MStar__7C8480AE]  DEFAULT ((0)),
	[BaseCCYiso] [nvarchar](255) NULL,
	[ExternalPM] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[IsMultiManager] [bit] NOT NULL CONSTRAINT [DF__tbl_Produ__IsMul__7D78A4E7]  DEFAULT ((0)),
	[IsFoF] [bit] NOT NULL CONSTRAINT [DF__tbl_Produ__IsFoF__7E6CC920]  DEFAULT ((0)),
	[HasOverlay] [bit] NOT NULL CONSTRAINT [DF__tbl_Produ__HasOv__7F60ED59]  DEFAULT ((0)),
	[InAs] [nvarchar](255) NULL,
	[SoldAs] [nvarchar](255) NULL,
	[IsUT] [bit] NOT NULL CONSTRAINT [DF__tbl_Produc__IsUT__00551192]  DEFAULT ((0)),
	[PrimaryObj] [nvarchar](50) NULL,
	[BenchmarkId] [smallint] NULL CONSTRAINT [DF__tbl_Produ__Bench__014935CB]  DEFAULT ((0)),
	[Strategy] [nvarchar](255) NULL,
	[Style] [nvarchar](50) NULL,
	[AssetClass] [nvarchar](255) NULL,
	[SubAssetClass] [nvarchar](50) NULL,
	[SizeBias] [nvarchar](50) NULL,
	[GeoFocus] [nvarchar](255) NULL,
	[OurPM] [nvarchar](255) NULL,
	[OurTeam] [nvarchar](255) NULL,
	[OurAnalyst] [nvarchar](255) NULL,
	[TPA] [nvarchar](255) NULL,
	[InceptionDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[BonusPool] [nvarchar](50) NULL,
	[CitiCode] [nvarchar](10) NULL,
	[RefShClass] [nvarchar](20) NULL,
	[LastPMChange] [datetime] NULL,
	[SRRIcat] [int] NULL CONSTRAINT [DF__tbl_Produ__SRRIc__7E22B05D]  DEFAULT ((1)),
	[FinanceName] [nvarchar](70) NULL CONSTRAINT [DF__tbl_Produ__Finan__19CACAD2]  DEFAULT (NULL),
	[SelectRefISIN] [nvarchar](20) NULL,
	[SelectRefMstar] [nvarchar](50) NULL,
	[IsSelect] [bit] NOT NULL CONSTRAINT [DF__tbl_Produ__IsSel__03A67F89]  DEFAULT ((0)),
	[IsSelectFull] [bit] NULL CONSTRAINT [DF__tbl_Produ__IsCor__28D80438]  DEFAULT ((0)),
	[IsCore] [bit] NULL CONSTRAINT [DF_tbl_Products_IsCore]  DEFAULT ((0)),
	[RiskLimitName] [nvarchar](15) NULL,
	[RiskLimitValue] [float] NULL
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'燁窃ꊓ伌▰஘ᅙ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Id'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1770' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'뜑⳵旫䥒妚귏龧钬' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PublicId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PublicId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PublicId'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ḍ餼뱋䴈邢怎禀' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ShortCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ShortCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ShortCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'5445' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'챩缛액䎕몞Ჴ䴼静' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'FundName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'FundName' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'FundName'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'伥僭쓭䍏銺몠같协' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'InvManager' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'InvManager' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InvManager'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2115' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䍧⅀猪侜㦮粶ꡉ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MStarCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MStarCode' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarCode'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'唽鬝诊䗽ᮡ瞮낤䒅' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MStarSPID' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MStarSPID' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'MStarSPID'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꮎ岉辗䰾媋ᴶ䋣ꠝ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BaseCCYiso' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BaseCCYiso' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BaseCCYiso'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'淆瞏䳭悪쬑ꅒ洣' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ExternalPM' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ExternalPM' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'ExternalPM'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䙆ꋦ䔭䫧徬䊧龗' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Company' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Company' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Company'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'灤죥䄬䪁庅꜋鈺' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsMultiManager' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsMultiManager' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsMultiManager'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꖁ�꿒䚹窜ꊑ楛柫' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsFoF' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsFoF' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsFoF'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'霒呟ۺ亚沐捨枼⿅' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HasOverlay' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HasOverlay' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'HasOverlay'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'绫⯿⼲䔈�쿴ꚛ蓄' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'InAs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'13' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'InAs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InAs'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㔕㺞㼖䌻ꎹ歈㥣�' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SoldAs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SoldAs' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SoldAs'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'௶볺퀍䟆馅秼ꍋ഑' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsUT' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'15' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsUT' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'IsUT'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⿉㇚ᚾ䩊ꆸ㦴馈긵' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PrimaryObj' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'16' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PrimaryObj' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'PrimaryObj'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㔑ᛋÛ䥺☺劢ꃐ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BenchmarkId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'17' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BenchmarkId' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'BenchmarkId'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'좒褛ᇵ䓬梦仅㻼疶' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Strategy' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'18' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Strategy' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Strategy'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2280' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'渠腨䓟莼鿆뉛뮎' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Style' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'19' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Style' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'Style'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䄡উ얉䨞ꚿꡬ�﷫' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AssetClass' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'20' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AssetClass' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'AssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'듭㒙䎀Რぢ훾䳱' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SubAssetClass' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'21' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SubAssetClass' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SubAssetClass'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'☉딬殐䞊쎣�葮' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SizeBias' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'22' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SizeBias' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'SizeBias'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'왎籷ዮ䘻Ⴗࡥ뵛쬔' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'GeoFocus' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'23' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'GeoFocus' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'GeoFocus'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'撄줸㊅䠉�졠Ꞧ쀎' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OurPM' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'24' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OurPM' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurPM'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'醛�쯛䠠톨汧㎲஠' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OurTeam' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'25' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OurTeam' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurTeam'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鏊阠䕹얏䚥⸏מ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OurAnalyst' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'26' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OurAnalyst' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'OurAnalyst'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ⲱ绯튐䴁ᦅ�ꢅ槆' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'TPA' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'27' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'TPA' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'TPA'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ﾭ፨墄䲉඄杸㱡' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'InceptionDate' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'28' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'InceptionDate' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products', @level2type=N'COLUMN', @level2name=N'InceptionDate'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'20/09/2012 08:12:45' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'FrozenColumns', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'20/09/2012 08:12:46' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'tbl_Products' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'100' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'tbl_Products'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_BenchPerfsSI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_BenchPerfsSI](
	[BchkId] [float] NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[IncDate] [datetime] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NOT NULL,
	[Ben_SI] [float] NULL,
	[Ben_SI_a] [float] NULL,
 CONSTRAINT [pk_BenchPerfsSI] PRIMARY KEY CLUSTERED 
(
	[BchkId] ASC,
	[CCY] ASC,
	[IncDate] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_BenchPerfs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_BenchPerfs](
	[CCY] [nvarchar](255) NOT NULL,
	[BchkId] [float] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[Ben1m] [float] NULL,
	[Ben3m] [float] NULL,
	[Ben6m] [float] NULL,
	[Ben1y] [float] NULL,
	[Ben2y] [float] NULL,
	[Ben3y] [float] NULL,
	[Ben5y] [float] NULL,
	[BenYtD] [float] NULL,
	[Beny-1] [float] NULL,
	[Beny-2] [float] NULL,
	[Beny-3] [float] NULL,
	[Beny-4] [float] NULL,
	[Beny-5] [float] NULL,
	[BenEo2y_TD] [float] NULL,
	[BenEo3y_TD] [float] NULL,
	[Ben2y_a] [float] NULL,
	[Ben3y_a] [float] NULL,
	[Ben5y_a] [float] NULL,
	[BenEo2y_TD_a] [float] NULL,
	[BenEo3y_TD_a] [float] NULL,
	[BenStD3y] [float] NULL,
	[BenStD1y] [float] NULL,
	[BenStD2y] [float] NULL,
	[BenStD5y] [float] NULL,
	[BenStDy-1] [float] NULL,
	[BenStDy-2] [float] NULL,
	[BenStDy-3] [float] NULL,
	[BenStDy-4] [float] NULL,
	[BenStDy-5] [float] NULL,
	[BenStDEo2y_TD] [float] NULL,
	[BenStDEo3y_TD] [float] NULL,
	[BenStDYtD] [float] NULL,
 CONSTRAINT [aaaaatbl_BenchPerfs_PK] PRIMARY KEY NONCLUSTERED 
(
	[CCY] ASC,
	[BchkId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TCFPeer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TCFPeer](
	[RefDate] [datetime] NOT NULL,
	[Item] [nvarchar](20) NOT NULL,
	[FundId] [int] NOT NULL,
	[PrimaryObj] [nvarchar](20) NULL,
	[Company] [nvarchar](10) NULL,
	[OurTeam] [nvarchar](20) NULL,
	[OurPM] [nvarchar](20) NULL,
	[Label1y] [nvarchar](100) NULL,
	[Label3y] [nvarchar](100) NULL,
	[Label5y] [nvarchar](100) NULL,
	[LabelBlend] [nvarchar](100) NULL,
	[FundAndIndex] [nvarchar](200) NULL,
	[ProdRank1y] [int] NULL,
	[PeersNo1y] [int] NULL,
	[Perc1y] [float] NULL,
	[Test1y] [int] NULL,
	[ProdRank3y] [int] NULL,
	[PeersNo3y] [int] NULL,
	[Perc3y] [float] NULL,
	[Test3y] [int] NULL,
	[ProdRank5y] [int] NULL,
	[PeersNo5y] [int] NULL,
	[Perc5y] [float] NULL,
	[Test5y] [int] NULL,
	[BlendRAG] [int] NULL,
	[NonPerfoming1y] [int] NULL,
	[TotalFunds1y] [int] NULL,
	[PercNonPerf1y] [float] NULL,
	[LowBound1y] [int] NULL,
	[HiBound1y] [int] NULL,
	[RAGIndex1y] [int] NULL,
	[NonPerfoming3y] [int] NULL,
	[TotalFunds3y] [int] NULL,
	[PercNonPerf3y] [float] NULL,
	[LowBound3y] [int] NULL,
	[HiBound3y] [int] NULL,
	[RAGIndex3y] [int] NULL,
	[NonPerfoming5y] [int] NULL,
	[TotalFunds5y] [int] NULL,
	[PercNonPerf5y] [float] NULL,
	[LowBound5y] [int] NULL,
	[HiBound5y] [int] NULL,
	[RAGIndex5y] [int] NULL,
	[NonPerfomingBlend] [int] NULL,
	[TotalFundsBlend] [int] NULL,
	[PercNonPerfBlend] [float] NULL,
	[LowBoundBlend] [int] NULL,
	[HiBoundBlend] [int] NULL,
	[RAGIndexBlend] [int] NULL,
 CONSTRAINT [pk_TCFPeer] PRIMARY KEY CLUSTERED 
(
	[RefDate] ASC,
	[FundId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ReportTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](15) NULL,
	[LongName] [nvarchar](100) NULL,
 CONSTRAINT [aaaaatbl_ReportTypes_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Reports]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Reports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](10) NULL,
	[LongName] [nvarchar](100) NULL,
	[FileName] [nvarchar](30) NULL,
	[ReportType] [int] NULL,
	[EMailAddresses] [ntext] NULL,
	[LastFileFolder] [nvarchar](100) NULL,
	[HistFileFolder] [nvarchar](100) NULL,
	[IsAvailable] [bit] NULL DEFAULT ((0)),
	[SourceName] [nvarchar](40) NULL,
	[PrintEoD] [bit] NULL DEFAULT ((0)),
	[CycleDesk] [bit] NULL DEFAULT ((0)),
	[CycleComp] [bit] NULL DEFAULT ((0)),
	[CyclePM] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_Reports_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RawDataInputType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_RawDataInputType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[InputType] [nvarchar](50) NULL,
	[InUse] [bit] NULL DEFAULT ((0)),
	[HeaderLines] [smallint] NULL,
	[AvoidLast] [int] NULL,
	[UseFormDate] [bit] NULL DEFAULT ((0)),
	[LoadTable] [nvarchar](50) NULL,
	[UseFCodesName] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_RawDataInputType_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FinanceAuM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FinanceAuM](
	[RefDate] [datetime] NOT NULL,
	[ShortCode] [nvarchar](20) NOT NULL,
	[Company] [nvarchar](10) NOT NULL,
	[FinanceName] [nvarchar](70) NOT NULL,
	[AuMGBP] [float] NULL,
 CONSTRAINT [aaaaatbl_FinanceAuM_PK] PRIMARY KEY NONCLUSTERED 
(
	[RefDate] ASC,
	[ShortCode] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PeerPerfsSLMC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PeerPerfsSLMC](
	[Classification] [nvarchar](10) NOT NULL,
	[Sector] [nvarchar](100) NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[SLMCdate] [datetime] NOT NULL,
	[PeerId] [nvarchar](255) NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[PeersNo_SLMC] [int] NULL,
	[PG1stQ_r_SLMC] [float] NULL,
	[PG1stQ_r_SLMC_a] [float] NULL,
	[PG3stQ_r_SLMC] [float] NULL,
	[PG3stQ_r_SLMC_a] [float] NULL,
	[PGavg_r_SLMC] [float] NULL,
	[PGavg_r_SLMC_a] [float] NULL,
	[PGmed_r_SLMC] [float] NULL,
	[PGmed_r_SLMC_a] [float] NULL,
 CONSTRAINT [aaaaatbl_PeerPerfsSLMC_PK] PRIMARY KEY NONCLUSTERED 
(
	[Classification] ASC,
	[Sector] ASC,
	[CCY] ASC,
	[SLMCdate] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PeersPerfsDY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PeersPerfsDY](
	[Classification] [nvarchar](10) NOT NULL,
	[Sector] [nvarchar](100) NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[Year] [smallint] NOT NULL,
	[PeersNo] [smallint] NULL,
	[Peers1stQ_r] [float] NULL,
	[Peers3stQ_r] [float] NULL,
	[PeersAvg] [float] NULL,
	[PeersMed] [float] NULL,
	[RefDate] [datetime] NOT NULL DEFAULT ('1/1/1980'),
	[PeersMedSD] [float] NULL,
 CONSTRAINT [aaaaatbl_PeersPerfsDY_PK] PRIMARY KEY NONCLUSTERED 
(
	[Classification] ASC,
	[Sector] ASC,
	[CCY] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FundsPerfsSLMC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FundsPerfsSLMC](
	[FundId] [float] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[NP_SLMC] [float] NULL,
	[NP_SLMC_a] [float] NULL,
	[ProdRank_SLMC] [int] NULL,
	[ProdAlpha_SLMC] [float] NULL,
	[ProdBeta_SLMC] [float] NULL,
 CONSTRAINT [aaaaatbl_FundsPerfsSLMC_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FundsPerfsDY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FundsPerfsDY](
	[FundId] [smallint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[FundNP] [float] NULL,
	[FundRank] [float] NULL,
	[FundBeta] [float] NULL,
	[FundAlpha] [float] NULL,
	[FundTE] [float] NULL,
	[FundSD] [float] NULL,
	[RefDate] [datetime] NOT NULL DEFAULT ('1/1/1980'),
	[ProdIR] [float] NULL,
	[ProdIRRank] [int] NULL,
	[PGIRNum] [int] NULL,
 CONSTRAINT [aaaaatbl_FundsPerfsDY_PK] PRIMARY KEY NONCLUSTERED 
(
	[FundId] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MiscellaneousKeys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_MiscellaneousKeys](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[keyName] [nvarchar](50) NULL,
	[keyValue] [ntext] NULL,
 CONSTRAINT [aaaaatbl_MiscellaneousKeys_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_BenchPerfsSLMC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_BenchPerfsSLMC](
	[BchkId] [float] NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[SLMCDate] [datetime] NOT NULL,
	[RefDate] [datetime] NOT NULL,
	[BizDate] [datetime] NULL,
	[Ben_SLMC] [float] NULL,
	[Ben_SLMC_a] [float] NULL,
 CONSTRAINT [aaaaatbl_BenchPerfsSLMC_PK] PRIMARY KEY NONCLUSTERED 
(
	[BchkId] ASC,
	[CCY] ASC,
	[SLMCDate] ASC,
	[RefDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Files]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[FileFolder] [nvarchar](100) NULL,
	[Code] [nvarchar](15) NULL,
	[Description] [nvarchar](200) NULL,
	[LastUpload] [datetime] NULL,
	[DataTypeId] [smallint] NULL,
	[Pwd] [nvarchar](50) NULL,
	[Sheet] [nvarchar](50) NULL,
	[HasHeader] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_Files_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_BenchPerfsDY]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_BenchPerfsDY](
	[BenchId] [smallint] NOT NULL,
	[CCY] [nvarchar](3) NOT NULL,
	[Year] [smallint] NOT NULL,
	[BenchPerf] [float] NULL,
	[BenchSD] [float] NULL,
	[RefDate] [datetime] NOT NULL DEFAULT ('1/1/1980'),
 CONSTRAINT [aaaaatbl_BenchPerfsDY1_PK] PRIMARY KEY NONCLUSTERED 
(
	[BenchId] ASC,
	[CCY] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Desks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Desks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[LongName] [nvarchar](50) NULL,
	[FileApp] [nvarchar](2) NULL,
 CONSTRAINT [aaaaatbl_Desks_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Companies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[LongName] [nvarchar](100) NULL,
	[FilterTxt] [nvarchar](20) NULL,
 CONSTRAINT [aaaaatbl_Companies_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FormsSetup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FormsSetup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](30) NULL,
	[FormCaption] [nvarchar](100) NULL,
	[Modal] [bit] NULL DEFAULT ((0)),
	[PopUp] [bit] NULL DEFAULT ((0)),
	[CloseButton] [bit] NULL DEFAULT ((0)),
	[BorderStyle] [int] NULL,
	[AutoCenter] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaatbl_FormsSetup_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
