В проекте представлены SQL-запросы (размещены в ветках Tables, Procedures, Functions, VIEWs, Triggers):
 - создание таблиц SKU, Family, Basket(запрос CreateStructure.sql в ветке Tables),
 - рассчет стоимости передаваемого продукта из таблицы dbo.Basket по формуле сумма Value по переданному SKU / сумма Quantity по переданному SKU (запрос dbo.udf_GetSKUPrice.sql в ветке Functions)
 - процедура dbo.usp_MakeFamilyPurchase в ветке Procedures при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике  dbo.Family.BudgetValue - sum(dbo.Basket.Value)
 - триггер dbo.TR_Basket_insert_update в ветке Triggers -если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0
 - представление dbo.vw_SKUPrice в ветке VIEWs возвращает все атрибуты продуктов из таблицы dbo.SKU и расчетный атрибут со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)
