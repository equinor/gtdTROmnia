/****** Object:  Table [endur].[hist_vw_portfolio_info]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_portfolio_info](
	[PORTFOLIO_ID] [int] NULL,
	[INFO_TYPE_ID] [int] NULL,
	[INFO_VALUE] [varchar](256) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_portfolio_info]
(
	[PORTFOLIO_ID] ASC,
	[INFO_TYPE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[hist_vw_portfolio_info] ADD  CONSTRAINT [DF_hist_vw_portfolio_info_LAST_UPDATE]  DEFAULT (getdate()) FOR [LAST_UPDATE]
GO
