/****** Object:  View [endur].[vw_count_vw_vw_dw_raw_pnl_detail_res]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [endur].[vw_count_vw_vw_dw_raw_pnl_detail_res]
AS
SELECT        EXTRACTION_ID, COUNT(EXTRACTION_ID) AS cnt
FROM            endur.vw_vw_dw_raw_pnl_detail_res
GROUP BY EXTRACTION_ID
GO
