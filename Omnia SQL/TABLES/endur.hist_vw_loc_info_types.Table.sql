/****** Object:  Table [endur].[hist_vw_loc_info_types]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_loc_info_types](
	[TYPE_NAME] [varchar](32) NULL,
	[TYPE_ID] [int] NULL,
	[SEC_GROUP_ID] [int] NULL,
	[REQUIRED_FLAG] [int] NULL,
	[PIPELINE_ID] [int] NULL,
	[PICK_LIST_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[DISPLAY_ORDER] [int] NULL,
	[DEFAULT_VALUE] [varchar](255) NULL,
	[DATA_TYPE] [int] NULL,
	[AUDIT_FLAG] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_loc_info_types]
(
	[TYPE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
