USE Tables
CREATE TABLE SKU(ID int PRIMARY KEY identity
				, Code AS 's' + CONVERT(VARCHAR(10), ID) UNIQUE
				, [Name] varchar(30));
CREATE TABLE Family(ID int PRIMARY KEY identity
				 , SurName varchar(30)
				 , BudgetValue int);
CREATE TABLE Basket(ID int PRIMARY KEY identity
					, ID_SKU int REFERENCES SKU(ID)
					, ID_Family int REFERENCES Family(ID)
					, Quantity int CHECK(Quantity >= 0)
					, [Value] int CHECK([Value] >= 0)
					, PurchaseDate date DEFAULT CONVERT (date, GETDATE())
					, DiscountValue int);