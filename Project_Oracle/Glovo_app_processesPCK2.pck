create or replace package Glovo_app_processesPCK2  is

  -- Author  : ACER
  -- Created : 10/9/2021 1:59:44 PM
  -- Purpose : 
  
 procedure Give_order_code (p_Customer_id  number,
                            p_restaurant_Id    number,
                            p_product_id    number,
                            p_customer_payment_method VARCHAR2,
                            p_order_status varchar2,     
                            p_orderID out number); 
                            
 procedure ready_order_code (p_pickup_time   DATE, 
                            p_delivery_fee  NUMBER, 
                            p_courier_id  NUMBER,
                            p_test out varchar2);                            

end Glovo_app_processesPCK2 ;
/
create or replace package body Glovo_app_processesPCK2  is

/*minda procedura romelic gamoutans momxmarebels infos javshnis kods
anu momxmarebelma unda sheiyvanos tavis info mere dagenerirdeba ID da productebidan product ID  */

  procedure Give_order_code (p_Customer_id  number,
                            p_restaurant_Id    number,
                            p_product_id    number,
                            p_customer_payment_method VARCHAR2,
                            p_order_status avrhar2,     
                            p_orderID out number) is --- axla ar  vici sxva table unda gavaketo ?
                           ---- anu ras ver vigeb tu order code tables avigeb mashin iq nalebi unda iyos ?
  begin
    insert into ORDERS_DATA
      (Customer_id, restaurant_Id, product_id, customer_payment_method,order_status )
    values
      (p_Customer_id,p_restaurant_Id, p_customer_payment_method,"pending")
    returning Order_code into p_orderID ;
    commit;
  
  end;
  
  -------------------------------------------------------------
  procedure ready_order_code (p_pickup_time   DATE, 
                            p_delivery_fee  NUMBER, 
                            p_courier_id  NUMBER,
                            p_test out varchar2) is 
     begin
    p_test:= 'approved_order' ;   
     update ORDERS_DATA
       set  order_status = 'approved'
     where courier_id =p_courier_id and pickup_time =p_pickup_time;
     commit;
  exception
    when others then
      p_test: := 'not approved yet' ;
  end;
  
  --------mgoni arasworia ra es , anu klients frontis nawilshi ra info unda gamouvides out parametri ?
                     

end Glovo_app_processesPCK2 ;
/
