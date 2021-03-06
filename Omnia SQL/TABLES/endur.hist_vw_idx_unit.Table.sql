/****** Object:  Table [endur].[hist_vw_idx_unit]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_idx_unit](
	[UNIT_ID] [int] NULL,
	[UNIT_LABEL] [varchar](32) NULL,
	[UNIT_TYPE_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL,
	[MASS_TYPE_ID] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_idx_unit]
(
	[UNIT_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
