/****** Object:  Table [endur].[stag_vw_unit_conversion]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_unit_conversion](
	[SRC_UNIT_ID] [int] NULL,
	[DEST_UNIT_ID] [int] NULL,
	[FACTOR] [float] NULL,
	[TYPE] [int] NULL
) ON [PRIMARY]
GO
