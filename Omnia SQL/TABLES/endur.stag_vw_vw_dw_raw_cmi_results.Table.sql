/****** Object:  Table [endur].[stag_vw_vw_dw_raw_cmi_results]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_vw_dw_raw_cmi_results](
	[EXTRACTION_ID] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[DEAL_LEG] [int] NULL,
	[PRICE_BAND] [int] NULL,
	[VALUE_DATE] [date] NULL,
	[PRICE] [float] NULL,
	[VOLUME] [float] NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[stag_vw_vw_dw_raw_cmi_results]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[stag_vw_vw_dw_raw_cmi_results] ADD  CONSTRAINT [DF_vw_vw_dw_raw_cmi_results_DB_TIMESTAMP]  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
