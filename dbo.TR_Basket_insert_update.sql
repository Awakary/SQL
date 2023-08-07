IF OBJECT_ID('dbo.TR_Basket_insert_update') IS NOT NULL
	DROP TRIGGER dbo.TR_Basket_insert_update;
GO

CREATE TRIGGER [dbo].[TR_Basket_insert_update]
ON [dbo].[Basket]
AFTER INSERT, UPDATE
AS IF(select count(Basket.ID_SKU) from Basket where Basket.ID_SKU = (SELECT ID_SKU FROM inserted)) = 1
	   UPDATE Basket
	   SET Basket.DiscountValue = 0
	   WHERE Basket.ID_SKU = (SELECT ID_SKU FROM inserted)
   
	   
	   
   ELSE 
  
   	   UPDATE Basket
	   SET Basket.DiscountValue = Basket.[Value] * 0.05
           WHERE Basket.ID_SKU = (SELECT ID_SKU FROM inserted)
 GO  