/****** Object:  Table [endur].[BW_FX_MONTH_AVG]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[BW_FX_MONTH_AVG](
	[FX_To] [nvarchar](10) NULL,
	[FX_From] [nvarchar](10) NULL,
	[FX_Date] [date] NULL,
	[FX_Multiplicator] [float] NULL
) ON [PRIMARY]
GO
