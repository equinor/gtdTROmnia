/****** Object:  Table [endur].[hist_vw_unit_type]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_unit_type](
	[UNIT_TYPE_ID] [int] NULL,
	[UNIT_TYPE_LABEL] [varchar](32) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL
) ON [PRIMARY]
GO
