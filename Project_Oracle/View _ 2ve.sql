---- view _ Customers Order History ;
/*create view Customers_Order_History as
select o.order_code,o.customer_id, o.creation_time,o.order_status, o.paid_amount "Total SUM", p.product_name, p.price
from orders_data o
left join products p
on o.product_id=p.product_id*/

/*
select * from Customers_Order_History*/

---------view Restaurants Order History; 
create view Restaurants_Order_Historyy as 
select o.order_code, o.creation_time, p.restaurand_id, p.product_name, p.price*(1- d.commission_fee) "Net_value" --- aq gamravlebis nishani  davuwere ragac damierora da ver gavige ra undoda 
from orders_data o
left join products p
on o.product_id=p.product_id
left join restaurants_data d
on p.restaurand_id = d.restaurant_id; 

/*select * from Restaurants_Order_Historyy ; */
