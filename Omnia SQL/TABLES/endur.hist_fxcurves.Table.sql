/****** Object:  Table [endur].[hist_fxcurves]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_fxcurves](
	[PRODUCT] [varchar](50) NOT NULL,
	[PRICING PERIOD] [int] NOT NULL,
	[PRICE UNIT] [varchar](1) NULL,
	[PRICE] [varchar](50) NOT NULL,
	[DB_TIMESTAMP] [datetime] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
