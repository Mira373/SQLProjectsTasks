USE [master]
GO
/****** Object:  Database [Toy_store]    Script Date: 1/21/2022 4:41:45 PM ******/
CREATE DATABASE [Toy_store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Toy_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Toy_store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Toy_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Toy_store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Toy_store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Toy_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Toy_store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Toy_store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Toy_store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Toy_store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Toy_store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Toy_store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Toy_store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Toy_store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Toy_store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Toy_store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Toy_store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Toy_store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Toy_store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Toy_store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Toy_store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Toy_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Toy_store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Toy_store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Toy_store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Toy_store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Toy_store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Toy_store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Toy_store] SET RECOVERY FULL 
GO
ALTER DATABASE [Toy_store] SET  MULTI_USER 
GO
ALTER DATABASE [Toy_store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Toy_store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Toy_store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Toy_store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Toy_store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Toy_store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Toy_store', N'ON'
GO
ALTER DATABASE [Toy_store] SET QUERY_STORE = OFF
GO
USE [Toy_store]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](30) NULL,
	[phone_num] [int] NULL,
	[address] [varchar](30) NULL,
	[city] [varchar](30) NULL,
	[zipcode] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[material_ID] [int] IDENTITY(1,1) NOT NULL,
	[material] [varchar](30) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_ID] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](30) NULL,
	[customer_id] [int] NULL,
	[sysdate] [date] NULL,
	[shop_id] [int] NULL,
	[staff_id] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item/history]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item/history](
	[order_ID] [int] NOT NULL,
	[orderItem_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[number_of_item] [int] NULL,
	[price_sum] [decimal](16, 2) NULL,
 CONSTRAINT [PK_order_item/history] PRIMARY KEY CLUSTERED 
(
	[order_ID] ASC,
	[orderItem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](30) NULL,
	[material_ID] [int] NULL,
	[selling_price] [decimal](16, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[shop_id] [int] IDENTITY(1,1) NOT NULL,
	[branch] [varchar](30) NULL,
	[phone_num] [int] NULL,
	[address] [varchar](30) NULL,
	[city] [varchar](30) NULL,
	[zipcode] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop_product]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_product](
	[shop_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_shop_product_1] PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](30) NULL,
	[phone_num] [int] NULL,
	[shop_id] [int] NULL,
	[supervisor_ID] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_item]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_item](
	[supItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[supplier_ID] [int] NULL,
	[product_id] [int] NULL,
	[price_net] [decimal](16, 2) NULL,
	[delivery_date] [date] NULL,
 CONSTRAINT [PK_supplier_item] PRIMARY KEY CLUSTERED 
(
	[supItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NULL,
	[IBAN] [varchar](50) NULL,
	[phone_num] [int] NULL,
	[address] [varchar](30) NULL,
	[contact_person] [varchar](30) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Material]    Script Date: 1/21/2022 4:41:45 PM ******/
ALTER TABLE [dbo].[Material] ADD  CONSTRAINT [IX_Material] UNIQUE NONCLUSTERED 
(
	[material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Suppliers]    Script Date: 1/21/2022 4:41:45 PM ******/
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [IX_Suppliers] UNIQUE NONCLUSTERED 
(
	[IBAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shop] ([shop_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shop]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
GO
ALTER TABLE [dbo].[order_item/history]  WITH CHECK ADD  CONSTRAINT [FK_order_item/history_Order] FOREIGN KEY([order_ID])
REFERENCES [dbo].[Order] ([order_ID])
GO
ALTER TABLE [dbo].[order_item/history] CHECK CONSTRAINT [FK_order_item/history_Order]
GO
ALTER TABLE [dbo].[order_item/history]  WITH CHECK ADD  CONSTRAINT [FK_order_item/history_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[order_item/history] CHECK CONSTRAINT [FK_order_item/history_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material] FOREIGN KEY([material_ID])
REFERENCES [dbo].[Material] ([material_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Material]
GO
ALTER TABLE [dbo].[shop_product]  WITH CHECK ADD  CONSTRAINT [FK_shop_product_Shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shop] ([shop_id])
GO
ALTER TABLE [dbo].[shop_product] CHECK CONSTRAINT [FK_shop_product_Shop]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shop] ([shop_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Shop]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Staff] FOREIGN KEY([supervisor_ID])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Staff]
GO
ALTER TABLE [dbo].[supplier_item]  WITH CHECK ADD  CONSTRAINT [FK_supplier_item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[supplier_item] CHECK CONSTRAINT [FK_supplier_item_Product]
GO
ALTER TABLE [dbo].[supplier_item]  WITH CHECK ADD  CONSTRAINT [FK_supplier_item_Suppliers] FOREIGN KEY([supplier_ID])
REFERENCES [dbo].[Suppliers] ([supplier_ID])
GO
ALTER TABLE [dbo].[supplier_item] CHECK CONSTRAINT [FK_supplier_item_Suppliers]
GO
/****** Object:  StoredProcedure [dbo].[Insert_into_customer]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mira
-- Create date:
-- Description:	Insert_into_
-- =============================================
CREATE PROCEDURE [dbo].[Insert_into_customer]
	-- Add the parameters for the stored procedure here
	(@full_name as  varchar(30),
     @phone_num as  int,
     @address as varchar(30),
     @city as  varchar(30),
     @zipcode as  int)
	
AS
BEGIN
BEGIN TRANSACTION
	INSERT INTO [dbo].[Customer]
           ([full_name]
           ,[phone_num]
           ,[address]
           ,[city]
           ,[zipcode])
     VALUES
           (@full_name,
            @phone_num, 
            @address,
            @city, 
           @zipcode)

		    IF(@@ERROR > 0)
      BEGIN
         ROLLBACK TRANSACTION
      END
      ELSE
      BEGIN
         COMMIT TRANSACTION
      END  
END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_material]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mira
-- Create date:
-- Description:	insert_into_
-- =============================================
CREATE PROCEDURE    [dbo].[insert_into_material]
    (@material as  varchar(30))
AS
BEGIN
BEGIN TRANSACTION
	INSERT INTO [dbo].[Material]
           ([material])
     VALUES
           (@material)
     IF count(@material) > 1 --- arasworia mgoni
    BEGIN
        PRINT 'it is on the list ';
    END 
    IF(@@ERROR > 0)
      BEGIN
         ROLLBACK TRANSACTION
      END
      ELSE
      BEGIN
         COMMIT TRANSACTION
      END  
END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_product]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date: 
-- Description:	insert_into_product
-- =============================================
CREATE PROCEDURE [dbo].[insert_into_product]
        (@product_name as varchar(30), 
		@material as varchar (30))

AS
BEGIN

Declare @material_ID  as int
Select @material_ID =m.material_ID  from Material m where m.material=@material

Declare @selling_price as decimal(16,2)
select @selling_price=i.price_net + i.price_net*0.2  from Product p full join supplier_item i on p.product_id =i.product_id --- es joini mgoni zedmetia

	INSERT INTO [dbo].[Product]
           ([product_name]
           ,[material_ID]
           ,[selling_price])
     VALUES
           (@product_name,
           @material_ID,
           @selling_price)
END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_shop]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date: 
-- Description:	insert_into_shop
-- =============================================
CREATE PROCEDURE [dbo].[insert_into_shop]
	-- Add the parameters for the stored procedure here
	 (@branch as  varchar(30),
      @phone_num as  int,
      @address as  varchar(30),
      @city as varchar(30),
      @zipcode as  int)
AS
BEGIN
BEGIN TRANSACTION
	INSERT INTO [dbo].[Shop]
           ([branch]
           ,[phone_num]
           ,[address]
           ,[city]
           ,[zipcode])
     VALUES
           (@branch,
            @phone_num, 
            @address,
            @city, 
           @zipcode)
	 IF(@@ERROR > 0)
      BEGIN
         ROLLBACK TRANSACTION
      END
      ELSE
      BEGIN
         COMMIT TRANSACTION
      END  
END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_shop_product]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date:
-- Description:	insert_into_shop_product 
-- =============================================
CREATE PROCEDURE [dbo].[insert_into_shop_product] 
	(@branch_name as varchar(30), 
	 @product_name as varchar(30))
AS
BEGIN
	declare @shop_id as int 
	select @shop_id=s.shop_id from Shop s where s.branch=@branch_name

	declare @product_id as int 
	select @product_id= p.product_id from Product p where p.product_name = @product_name

	declare @total as int 
	set @total= (select p.total-h.number_of_item  from [order_item/history] h full join shop_product p on h.product_id=p.product_id full join [Order] o on o.shop_id =p.shop_id where p.shop_id = ( select shop_id from Shop s where s.branch=@branch_name))

    INSERT INTO [dbo].[shop_product]
           ([shop_id]
           ,[product_id]
           ,[total])
     VALUES
           (@shop_id,
            @product_id,
            @total)



END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_supplier_item]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date:
-- Description:	insert_into_supplier_item
-- =============================================
CREATE PROCEDURE [dbo].[insert_into_supplier_item]
    (@supplier_name as varchar(30),
	 @product_name as varchar(30),
	 @price_net as decimal(16,2),
	 @delivery_date as date)
	
AS
BEGIN

declare @supplier_ID as int
select  @supplier_ID=s.supplier_ID from Suppliers s where s.name= @supplier_name

declare @product_id as int 
select @product_id =p.product_id  from Product p where p.product_name= @product_name


	INSERT INTO [dbo].[supplier_item]
           ([supplier_ID]
           ,[product_id] ---- aq ar momwons rom nameis magivrad ID maqvs 
           ,[price_net]
           ,[delivery_date])
     VALUES
           (@supplier_ID,
           @product_id,
           @price_net,
          @delivery_date)
END
GO
/****** Object:  StoredProcedure [dbo].[insert_into_suppliers]    Script Date: 1/21/2022 4:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date: 
-- Description:	insert_into_suppliers
-- =============================================
CREATE PROCEDURE [dbo].[insert_into_suppliers]
    (@name as varchar(30),
     @IBAN as  varchar(50),
     @phone_num as  int,
     @address as  varchar(30),
     @contact_person as  varchar(30))
AS
BEGIN
BEGIN TRANSACTION
	INSERT INTO [dbo].[Suppliers]
           ([name]
           ,[IBAN]
           ,[phone_num]
           ,[address]
           ,[contact_person])
     VALUES
     (@name,
     @IBAN ,
     @phone_num,
     @address ,
     @contact_person )

    IF(@@ERROR > 0)
      BEGIN
         ROLLBACK TRANSACTION
      END
      ELSE
      BEGIN
         COMMIT TRANSACTION
      END  
	
END
GO
USE [master]
GO
ALTER DATABASE [Toy_store] SET  READ_WRITE 
GO
