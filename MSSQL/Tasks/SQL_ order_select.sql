USE [exam]
GO

SELECT [Number]
      ,convert (varchar,[order_date], 101) AS [order_date]
      ,[cust_id]
      ,[salesperson_id]
      ,[Amount]
  FROM [dbo].[Orders]

GO


