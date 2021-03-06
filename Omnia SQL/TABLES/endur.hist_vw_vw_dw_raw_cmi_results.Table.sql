/****** Object:  Table [endur].[hist_vw_vw_dw_raw_cmi_results]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_vw_dw_raw_cmi_results](
	[EXTRACTION_ID] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[DEAL_LEG] [int] NULL,
	[PRICE_BAND] [int] NULL,
	[VALUE_DATE] [date] NULL,
	[PRICE] [float] NULL,
	[VOLUME] [float] NULL,
	[DB_TIMESTAMP] [datetime] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_vw_dw_raw_cmi_results]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[hist_vw_vw_dw_raw_cmi_results] ADD  DEFAULT (getdate()) FOR [DB_TIMESTAMP_H]
GO
