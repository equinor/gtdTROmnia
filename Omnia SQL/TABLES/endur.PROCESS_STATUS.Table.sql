/****** Object:  Table [endur].[PROCESS_STATUS]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[PROCESS_STATUS](
	[STATUS] [smallint] NULL,
	[PROCESS] [nchar](24) NULL,
	[START_TIME] [datetime] NULL,
	[END_TIME] [datetime] NULL
) ON [PRIMARY]
GO
