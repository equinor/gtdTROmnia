/****** Object:  Table [endur].[vw_idx_historical_prices]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_idx_historical_prices](
	[INDEX_ID] [int] NULL,
	[RESET_DATE] [date] NULL,
	[PRICE] [float] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[TIME] [int] NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
	[YIELD_BASIS] [int] NULL,
	[REF_SOURCE] [int] NULL,
	[INDEX_LOCATION] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_idx_historical_prices]
(
	[INDEX_ID] ASC,
	[RESET_DATE] ASC,
	[START_DATE] ASC,
	[REF_SOURCE] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
