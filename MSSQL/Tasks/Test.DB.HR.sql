
-----------თეიბლები
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](30) NULL,
	[personal_n] [int] NULL,
	[phone_number] [int] NULL,
	[start_date] [date] NULL,
	[IBAN_num] [varchar](30) NULL,
	[ID_Job] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[personal_n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Employee_1] UNIQUE NONCLUSTERED 
(
	[IBAN_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------


REATE TABLE [dbo].[Evaluation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Working_years] [date] NULL,
	[ID_employees] [int] NULL,
	[Comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-------------------------------------

CREATE TABLE [dbo].[Job_info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[salary] [decimal](18, 0) NULL,
	[department] [varchar](50) NULL,
	[position] [varchar](50) NULL,
 CONSTRAINT [PK_Job_info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

------------------------------------პროცედურები: 
ALTER PROCEDURE [dbo].[insert_into_Employees]
           (@full_name AS varchar(30),
           @personal_n AS int,
           @phone_number AS  int,
           @start_date AS  date,
           @IBAN_num AS  varchar(30),
		   @department_name AS varchar(50))
AS
BEGIN

 Declare @ID_D AS int
 select @ID_D=o.ID from Job_info o  where o.department=@department_name

 INSERT INTO [dbo].[Employee]
           ([full_name]
           ,[personal_n]
           ,[phone_number]
           ,[start_date]
           ,[IBAN_num]
           ,[ID_Job])
     VALUES
           (@full_name
           ,@personal_n 
           ,@phone_number
           ,@start_date 
           ,@IBAN_num
           ,@ID_D)
END;
--------------------

CREATE PROCEDURE insert_into_Evaluation
            (@Full_name AS  int)
As
BEGIN

   Declare @ID_E AS int
   select @ID_E =e.ID from[dbo].[Employee]e  where e.full_name= @Full_name

   Declare @Working_years AS date
   set  @Working_years=(SELECT DATEDIFF(year, [Working_years], getdate())from [dbo].[Evaluation])
 
 
 
  Declare @Comment AS varchar
  set @Comment=(SELECT 
	  CASE 
	     WHEN YEAR(@Working_years)>5 THEN  'old_emp'
		 WHEN  YEAR(@Working_years)BETWEEN 2 AND  5  THEN  'not that old'
		 ELSE 'new'
      END AS [Comment]
     FROM [dbo].[Evaluation]
     where ID_employees=(select e.ID from[dbo].[Employee]e  where e.full_name= @Full_name))
 
  INSERT INTO [dbo].[Evaluation]
    ([Working_years]
    ,[ID_employees]
    ,[Comment])
 VALUES
    (@Working_years,
     @ID_E, 
     @Comment)


END;
--------------------ჯოინები 
SELECT 
      e.[Working_years],
	  m.full_name,
	  j.department,
	  j.salary    
  FROM [dbo].[Evaluation]e
  left join[dbo].[Employee]m
  on e.ID_employees=m.ID
  left join [dbo].[Job_info] j
  on j.ID=m.ID_Job
  Where [Comment]= 'old'