/****** Object:  Table [endur].[stag_fxcurves]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_fxcurves](
	[Product] [varchar](50) NOT NULL,
	[Pricing Period] [int] NOT NULL,
	[Price Unit] [varchar](1) NULL,
	[Price] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
