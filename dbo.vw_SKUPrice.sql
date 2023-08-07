IF OBJECT_ID('dbo.SKUPrice') IS NOT NULL
	DROP VIEW dbo.SKUPrice;
GO
CREATE VIEW [dbo].[SKUPrice]
AS
SELECT        s.ID, s.Code, s.Name, dbo.udfGetSKUPrice(b.ID_SKU) AS Price
FROM            dbo.SKU AS s INNER JOIN
                         dbo.Basket AS b ON s.ID = b.ID_SKU
