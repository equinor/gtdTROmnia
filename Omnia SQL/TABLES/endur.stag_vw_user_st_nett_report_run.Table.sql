/****** Object:  Table [endur].[stag_vw_user_st_nett_report_run]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_user_st_nett_report_run](
	[RUN_DATE] [datetime] NULL,
	[REPORT_ID] [int] NULL,
	[USER_ID] [varchar](256) NULL,
	[QUERY_NAME] [varchar](256) NULL,
	[RUN_TYPE] [varchar](256) NULL,
	[SEND_TO_EBOSS] [int] NULL,
	[EOD_SIM_IDS] [varchar](256) NULL,
	[RUN_MONTH] [varchar](256) NULL,
	[RUN_PERIOD] [varchar](256) NULL,
	[SDFI_SPLIT] [float] NULL,
	[IMBALANCE_PRICE_GBP] [float] NULL,
	[IMBALANCE_PRICE_EUR] [float] NULL,
	[COMMODITY] [varchar](256) NULL,
	[EOD_SIM_DATE] [varchar](256) NULL
) ON [PRIMARY]
GO
