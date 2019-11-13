/****** Object:  View [endur].[view_union_pnl_portfolio_adjust]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [endur].[view_union_pnl_portfolio_adjust]
AS
SELECT        a.*, '9999-12-31' AS VALID_TO
FROM             endur.vw_vw_dw_pnl_portfolio_adjust a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
UNION all
SELECT       a. *
FROM             endur.hist_vw_vw_dw_pnl_portfolio_adjust a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
GO
