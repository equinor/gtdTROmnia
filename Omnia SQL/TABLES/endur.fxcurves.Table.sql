/****** Object:  Table [endur].[fxcurves]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[fxcurves](
	[PRODUCT] [varchar](50) NOT NULL,
	[PRICING PERIOD] [int] NOT NULL,
	[PRICE UNIT] [varchar](1) NULL,
	[PRICE] [varchar](50) NOT NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [endur].[fxcurves] ADD  CONSTRAINT [DF_fxcurves_DB_TIMESTAMP]  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
