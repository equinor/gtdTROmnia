/****** Object:  Table [endur].[vw_vw_rep_bu]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_vw_rep_bu](
	[BU_ID] [varchar](5) NULL,
	[BU_NAME] [varchar](40) NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [endur].[vw_vw_rep_bu] ADD  CONSTRAINT [DF_vw_vw_rep_bu_DB_TIMESTAMP]  DEFAULT (dateadd(year,datediff(year,(0),getdate()),(0))) FOR [DB_TIMESTAMP]
GO
