/****** Object:  Table [endur].[stag_vw_idx_unit]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_idx_unit](
	[UNIT_ID] [int] NULL,
	[UNIT_LABEL] [varchar](32) NULL,
	[UNIT_TYPE_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL,
	[MASS_TYPE_ID] [int] NULL
) ON [PRIMARY]
GO
