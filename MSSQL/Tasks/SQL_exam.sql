--1.შექმენით მონაცემთა ბაზა სურათი N1-ზე ილუსტრირებული მოდელის მიხედვით.
--1.1.გაითვალისწინეთ მონაცემთა ტიპი თითოეული ცხრილისათვის.
--1.2.გაითვალისწინეთ ცხრილებს შორის კავშირი.

------[Customers] Table 
--CREATE TABLE [dbo].[Customers](
--	[ID] [int] NOT NULL,
--	[Name] [varchar](15) NOT NULL,
--	[City] [varchar](15) NOT NULL,
--	[Industry_Type] [varchar](5) NOT NULL,
-- CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
----------[Orders]Table
--CREATE TABLE [dbo].[Orders](
--	[Number] [int] IDENTITY(10,10) NOT NULL,
--	[order_date] [datetime] NOT NULL,
--	[cust_id] [int] NOT NULL,
--	[salesperson_id] [int] NOT NULL,
--	[Amount] [decimal](18, 0) NOT NULL,
-- CONSTRAINT [PK_Orders_1] PRIMARY KEY CLUSTERED
-------------------[Salesperson] Table 
--CREATE TABLE [dbo].[Salesperson](
--	[ID] [int] NOT NULL,
--	[Name] [varchar](15) NOT NULL,
--	[Age] [int] NOT NULL,
--	[Salary] [decimal](18, 0) NOT NULL,
-- CONSTRAINT [PK_Salesperson] PRIMARY KEY CLUSTERED 

--2. შეავსეთ Salesperson და Сustomer ცხრილები მონაცემებით.

---------------INSERT INTO ბრძანებით
--INSERT INTO [dbo].[Customers]
--           ([ID]
--           ,[Name]
--           ,[City]
--           ,[Industry_Type])
--     VALUES
--           (<ID, int,>
--           ,<Name, varchar(15),>
--           ,<City, varchar(15),>
--           ,<Industry_Type, varchar(5),>)
------------------
--INSERT INTO [dbo].[Salesperson]
--           ([ID]
--           ,[Name]
--           ,[Age]
--           ,[Salary])
--     VALUES
--           (<ID, int,>
--           ,<Name, varchar(15),>
--           ,<Age, int,>
--           ,<Salary, decimal(18,0),>)


--3.შექმენით პროცედურა SaveOrders, რომელსაც პარამეტრად გადაეცემა order_date,
--customer_name, sales_person_name, amount და შესაბამის ინფორმაციას შეინახავს Orders
--ცხრილში.    ---ორდერის ცხრილი თვიდანვე შევქმენით


-- =============================================
-- Author:		Miranda Begashvili
-- Create date: 11/19/2021
-- Description:	incert into a table procedure
-- =============================================
--CREATE PROCEDURE [dbo].[SaveOrders] 
--	-- Add the parameters for the stored procedure here
--	 @order_date datetime, 
--	 @customer_name varchar(15),
--	 @sales_person_name  varchar(15),
--	 @amunt decimal(18,0)
--AS
--BEGIN
--   Declare @ID_cust AS int
--	 select @ID_cust=c.ID from Customers c where c.Name=@customer_name

--	 Declare @ID_SalesP AS int
--	 select @ID_SalesP=s.ID from Salesperson s where s.Name=@sales_person_name

--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--    -- Insert statements for procedure here
--	INSERT INTO [dbo].[Orders]
--           ([order_date]
--           ,[cust_id]
--           ,[salesperson_id]
--           ,[Amount])
--     VALUES
--           (convert (varchar, @order_date, 101), -----მგონი აქ არ გადაყავს და სელექტს დავწერ, რომ გასწორდეს. 
--            @ID_cust,
--            @ID_SalesP,
--            @amunt) 
--END
-------------------------------------order_date შესაბამისი ფორმატით( როგორც ტესტშია), რომ გამოაჩინოს ამისთვის მინდა 
--SELECT [Number]
--      ,convert (varchar,[order_date], 101) AS [order_date]
--      ,[cust_id]
--      ,[salesperson_id]
--      ,[Amount]
--  FROM [dbo].[Orders]


--4. შექმენით მოთხოვნა, რომელიც დააბრუნებს იმ გაყიდვების მენეჯერების სიას,
--რომელთა შემკვეთი იყო Samony.

--Select s.Name AS Manager_Name  
--From Salesperson s
--left join Orders o
--on s.ID=o.salesperson_id
--left join Customers c
--on c.ID=o.cust_id
--Where c.Name='Samony'

--5. შექმენით მოთხოვნა, რომელიც დააბრუნებს იმ გაყიდვების მენეჯერების სიას,
--რომელთა შეკვეთების რაოდენობა არ აღემატება 2-ს.

--Select s.Name AS Manager_Name,Count(o.salesperson_id) AS C_Orders  -- რახან მენეჯერების მიხედვით გვიწევს ორდერების დათვლა(ქოლუმი არაა ცალკე ორდერების რაოდენობებისთვის) 
--From Salesperson s
--left join Orders o
--on s.ID=o.salesperson_id
--left join Customers c
--on c.ID=o.cust_id
--Group by s.Name
--Having Count(o.salesperson_id)<=2


--6. დაწერეთ მოთხოვნა, რომელიც LowAchiever(Name, Age) ცხრილში გადაწერეს იმ
--გაყიდვების მენეჯერების სახელს და ასაკს, რომელთა ხელფასი არ აღემატება 50 000-ს.

--Select s.[Name] AS 'Name', s.Age AS Age
--Into [dbo].LowAchiever
--From [dbo].Salesperson s
--Where  s.Salary <=50000;

--7. დაამუშავეთ მოთხოვნა, რომელიც დააჯგუფებს მონაცემებს მომხმარებლების
--ქალაქების მიხედვით და დაითვლის თითოეულისთვის შეკვეთის ჯამურ
--ღირებულებას.

--Select c.City, SUM(o.Amount) AS Orders_SUM
--From Customers c
--left join Orders o --- ანუ მე ასეთი ჯოინით დავინახავ ქალაქების მიხედვით შეკვეთების ჯამურ ღირებულებას და ყველა ქალაქს გამოიტანს( ამიტომ არის ნალი ერთგან ) 
--On c.ID=o.cust_id
--Group by c.City

--8. დაწერეთ ფუნქცია სახელად GetAverageAmountByDate, რომელსაც გადაეცემა
--პარამეტრებად ორი თარიღი (start_date, end_date) და მითითებული შუალედისთვის
--დააბრუნებს შეკვეთის საშუალო ღირებულებას.

-- =============================================
-- Author:		Miranda Begashvili
-- Create date: 11.19.2021
-- Description:	
-- =============================================
--CREATE FUNCTION GetAverageAmountByDate
--(
--	-- Add the parameters for the function here
--	@start_date datetime, 
--	@end_date datetime)

--RETURNS decimal
--AS
--BEGIN
--	-- Declare the return variable here
--	DECLARE @AverageAmountByDate AS decimal ; 

--	-- Add the T-SQL statements to compute the return value here
--	SELECT @AverageAmountByDate=AVG(o.Amount) from Orders o 
--	where o.order_date Between @start_date and @end_date   ; 

--	-- Return the result of the function
--	RETURN  @AverageAmountByDate; 

--END
