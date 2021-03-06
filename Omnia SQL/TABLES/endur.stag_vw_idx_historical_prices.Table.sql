/****** Object:  Table [endur].[stag_vw_idx_historical_prices]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_idx_historical_prices](
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
