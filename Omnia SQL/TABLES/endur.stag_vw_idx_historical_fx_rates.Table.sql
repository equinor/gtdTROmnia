/****** Object:  Table [endur].[stag_vw_idx_historical_fx_rates]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_idx_historical_fx_rates](
	[REFERENCE_CURRENCY_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[FX_RATE_OFFER] [float] NULL,
	[FX_RATE_MID] [float] NULL,
	[FX_RATE_DATE] [date] NULL,
	[FX_RATE_BID] [float] NULL,
	[DATA_SET_TYPE] [int] NULL,
	[CURRENCY_ID] [int] NULL,
	[CURRENCY_CONVENTION] [int] NULL
) ON [PRIMARY]
GO
