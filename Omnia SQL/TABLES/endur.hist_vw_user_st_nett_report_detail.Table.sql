/****** Object:  Table [endur].[hist_vw_user_st_nett_report_detail]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_user_st_nett_report_detail](
	[REPORT_ID] [int] NULL,
	[CUSTOMER_GROUP] [varchar](256) NULL,
	[BUY_SELL] [varchar](256) NULL,
	[CURRENCY] [varchar](256) NULL,
	[DEL_MONTH] [varchar](256) NULL,
	[QUANTITY] [float] NULL,
	[QUANTITY_UNIT] [varchar](256) NULL,
	[VALUE] [float] NULL,
	[TAX_REGIME] [varchar](256) NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_user_st_nett_report_detail]
(
	[REPORT_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
