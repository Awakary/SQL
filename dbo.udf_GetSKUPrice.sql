IF OBJECT_ID('dbo.udfGetSKUPrice') IS NOT NULL
	DROP FUNCTION dbo.udfGetSKUPrice;
GO

CREATE FUNCTION dbo.udfGetSKUPrice(@ID_SKU int)
	RETURNS decimal(18, 2)
    BEGIN
        DECLARE @skuprice DEC(18,2)
        SELECT   @skuprice = b.[Value] /b.Quantity FROM dbo.Basket b WHERE b.ID_SKU = @ID_SKU
        RETURN @skuprice
    END;
GO