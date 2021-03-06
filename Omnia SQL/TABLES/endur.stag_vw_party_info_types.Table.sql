/****** Object:  Table [endur].[stag_vw_party_info_types]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_party_info_types](
	[TYPE_ID] [int] NULL,
	[TYPE_NAME] [varchar](32) NULL,
	[DATA_TYPE] [int] NULL,
	[PARTY_CLASS] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[INT_EXT] [int] NULL,
	[REQUIRED_FLAG] [int] NULL,
	[DEFAULT_VALUE] [varchar](32) NULL,
	[PICK_LIST_ID] [int] NULL,
	[SEC_GROUP_ID] [int] NULL,
	[AUDIT_FLAG] [int] NULL,
	[PARTY_ORDER] [int] NULL,
	[VERSION_NUMBER] [int] NULL,
	[MULTI_SELECT_FLAG] [int] NULL
) ON [PRIMARY]
GO
