/****** Object:  Table [endur].[hist_vw_currency]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_currency](
	[NAME] [varchar](32) NULL,
	[ID_NUMBER] [int] NULL,
	[DEFAULT_INDEX] [int] NULL,
	[SPOT_INDEX] [int] NULL,
	[CONVENTION] [int] NULL,
	[HOLIDAY_ID] [int] NULL,
	[BASE_UNIT] [int] NULL,
	[ROUND] [int] NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[ROUND_TYPE] [int] NULL,
	[EURO] [int] NULL,
	[EURO_CONVERSION] [float] NULL,
	[CURRENCY_ZONE] [int] NULL,
	[EURO_SCENARIO_FLAG] [int] NULL,
	[ADVANCE_RELEASE_DAYS] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[PRECIOUS_METAL] [int] NULL,
	[AUTO_CONVERSION_FLAG] [int] NULL,
	[VERSION_NUMBER] [int] NULL
) ON [PRIMARY]
GO
