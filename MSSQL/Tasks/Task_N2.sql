--საშინაო დავალება/სასემინარო აქტივობა 2


--***** ცხრილის შექმნა/წაშლა/მოდიფიკაცია
--_____შექმნა : თავისი კონსტრეინტები ადევს ცხრილშიც _ ზოგი unique key _ არის 
--CREATE TABLE [dbo].[Employee](
--	[ID] [int] NOT NULL,
--	[full_name] [varchar](30) NULL,
--	[personal_n] [int] NULL,
--	[phone_number] [int] NULL,
--	[start_date] [date] NULL,
--	[IBAN_num] [varchar](30) NULL,
-- CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
--(
--	[ID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
--(
--	[personal_n] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
-- CONSTRAINT [IX_Employee_1] UNIQUE NONCLUSTERED 
--(
--	[IBAN_num] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]

--_____წაშლა :
--DROP TABLE [dbo].[Employee]

--_____მოდიფიკაცია: 

--ALTER TABLE [dbo].[Employee]
--DROP COLUMN [phone_number]

--UPDATE [dbo].[Employee]
--   SET [ID] = <ID, int,>
--      ,[full_name] = <full_name, varchar(30),>
--      ,[personal_n] = <personal_n, int,>
--      ,[phone_number] = <phone_number, int,>
--      ,[start_date] = <start_date, date,>
--      ,[IBAN_num] = <IBAN_num, varchar(30),>
-- WHERE <Search Conditions,,>

-- INSERT INTO [dbo].[Employee]
--           ([ID]
--           ,[full_name]
--           ,[personal_n]
--           ,[phone_number]
--           ,[start_date]
--           ,[IBAN_num])
--     VALUES
--           (<ID, int,>
--           ,<full_name, varchar(30),>
--           ,<personal_n, int,>
--           ,<phone_number, int,>
--           ,<start_date, date,>
--           ,<IBAN_num, varchar(30),>)

--DELETE FROM [dbo].[Employee]
--      WHERE <Search Conditions,,>



--****ცხრილიდან მონაცემების ამორჩევის ბრძანების ელემენტები (FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, TOP და სხვ.)
--SELECT [Name]
--FROM [dbo].[Salesperson]
------------------------------------
--SELECT [Name]
--FROM [dbo].[Salesperson]
--where [Name]='Bob'
---------------------------------
--SELECT [ID]
--      ,[Name]
--      ,[Age]
--      ,[Salary]
--  FROM [dbo].[Salesperson]
--  Order by [Salary] desc, [Name] asc 
------------------------------------

--SELECT
--      SUM([Amount]) AS SUM_Amount
--  FROM [dbo].[Orders]
--  Group by salesperson_id
--  Having salesperson_id=3

---------------------------------------------
--SELECT TOP (5) [Number]
--      ,[order_date]
--      ,[cust_id]
--      ,[salesperson_id]
--      ,[Amount]
--  FROM [exam].[dbo].[Orders]

--***** აგრეგირების ფუნქციები

-- SELECT 
--      MAX([Amount]) AS MAX_Amount
--  FROM [exam].[dbo].[Orders]
-------------------------------------------
--  SELECT 
--      MIN(cast([order_date] as date)) AS [order_date]
 
--  FROM [dbo].[Orders]
--------------------------------------------
--  SELECT  
--  AVG([Amount])AS AVG_Amount,
--  SUM([Amount])AS SUM_Amount
--  FROM [dbo].[Orders]
-- ------------------------------------
--  SELECT 
--      Count([City]) AS [City],
--      [Industry_Type]
--  FROM [dbo].[Customers]
--  Group by [Industry_Type]