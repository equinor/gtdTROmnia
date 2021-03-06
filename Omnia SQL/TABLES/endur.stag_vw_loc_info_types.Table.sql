/****** Object:  Table [endur].[stag_vw_loc_info_types]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_loc_info_types](
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
	[AUDIT_FLAG] [int] NULL
) ON [PRIMARY]
GO
