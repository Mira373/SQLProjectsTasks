
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mira
-- Create date: 
-- Description:	insert_ into_order_history
-- =============================================
CREATE PROCEDURE insert_into_order_history
    (@customer_fullname as varchar(30))
	
AS
BEGIN
declare @order_ID as int
select @order_ID=o.order_ID  from [Order] o full join Customer c on o.customer_id=c.customer_id where c.full_name=@customer_fullname

declare @orderItem_id as int ----- araa swori gadawyvetaa
select @orderItem_id=count(h.order_ID) from order_history h full join [Order]o on o.order_ID=h.order_ID 
full join Customer c on o.customer_id=c.customer_id where c.full_name=@customer_fullname group by order_ID

declare @product_id as int
select @product_id  from order_history h full join [Order] o  on o.order_ID=h.order_ID 
full join Customer c  on o.customer_id=c.customer_id where c.full_name=@customer_fullname

declare @number_of_item as int 



declare @price_sum as decimal(16,2)
select @price_sum=h.number_of_item*p.selling_price from order_history h full join Product  p on  h.product_id=p.product_id

	INSERT INTO [dbo].[order_history]
           ([order_ID]
           ,[orderItem_id]
           ,[product_id]
           ,[number_of_item] ---- es agar mushoabs  rodesac  @orderItem_id_ is zeit wom gavushvi ise rodesac vwer 
           ,[price_sum])
     VALUES
           (@order_ID,
           @orderItem_id,
           @product_id,
           @number_of_item,
           @price_sum)
END
GO
