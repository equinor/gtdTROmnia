/****** Object:  Table [endur].[hist_vw_idx_historical_fx_rates]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_idx_historical_fx_rates](
	[REFERENCE_CURRENCY_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[FX_RATE_OFFER] [float] NULL,
	[FX_RATE_MID] [float] NULL,
	[FX_RATE_DATE] [date] NULL,
	[FX_RATE_BID] [float] NULL,
	[DATA_SET_TYPE] [int] NULL,
	[CURRENCY_ID] [int] NULL,
	[CURRENCY_CONVENTION] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_idx_historical_fx_rates]
(
	[FX_RATE_DATE] ASC,
	[CURRENCY_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
