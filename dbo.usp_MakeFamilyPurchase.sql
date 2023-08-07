IF OBJECT_ID('usp_MakeFamilyPurchase', 'P') IS NOT NULL
	DROP PROC usp_MakeFamilyPurchase;
GO
CREATE PROCEDURE [dbo].[usp_MakeFamilyPurchase] 
    @FamilySurName varchar(255)
AS
	IF @FamilySurName in(SELECT Surname from Family)
	UPDATE Family 
	SET BudgetValue =  BudgetValue - (SELECT SUM(Value) from dbo.Basket b JOIN dbo.Family f ON  f.ID = b.ID_Family WHERE f.SurName = @FamilySurName)	
	WHERE SurName = @FamilySurName
	ELSE
   	PRINT N'Такой семьи нет'
GO