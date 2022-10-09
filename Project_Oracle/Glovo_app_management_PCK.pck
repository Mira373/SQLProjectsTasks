create or replace package Glovo_app_management_PCK is

  -- Author  : ACER
  -- Created : 10/7/2021 5:38:38 PM
  -- Purpose : project_ assignement_ fulfillment 
  
  
-------------------------------------------------------------------------  
procedure Add_CUSTOMERS_DATA (p_full_name VARCHAR2, ------- varcharshi is formatireba ar chamawerna rac tableze aqvs da wavshale customrs_data.full_name%type esec sheidzleba 
                              p_bank_account VARCHAR2,
                              p_email VARCHAR2,
                              p_address VARCHAR2, p_test out  varchar2);

--------------------------------------------------------------------------
procedure Add_RESTAURANTS_DATE(p_address  VARCHAR2,
                              p_legal_name   VARCHAR2,
                              p_tax_id  NUMBER,
                              p_bank_account   VARCHAR2,
                              p_email   VARCHAR2,
                              p_working_hours  VARCHAR2,
                              p_commission_fee varchar2,  p_test out  varchar2);
                                                     
----------------------------------------------------------------------------                              
procedure Add_COURIERS_DATA  ( p_full_name     VARCHAR2,
                               p_personal_n    NUMBER,    
                               P_phone_number  NUMBER,
                               p_starting_date DATE,
                               p_trasporttype  VARCHAR2,
                               p_IBAN_NUM VARCHAR2, p_test out  varchar2);-- Shecdomas agdebs ra unda ver gavige 
                             
---------------------------------------------------------------------------                             
procedure Add_PRODUCTS (p_restaurand_id NUMBER,
                        p_product_name  VARCHAR2,
                        p_price  NUMBER ,p_test out  varchar2) ; 
                        
----------------------------------------------------------------------------
procedure Add_ORDERS_DATA (p_creation_time  DATE default sysdate,
                           p_pickup_time   DATE,
                           p_delivery_time DATE,
                           p_delivery_fee  NUMBER,
                           p_courier_id  NUMBER,
                           p_customer_id  NUMBER,
                           p_order_status  VARCHAR2,
                           p_paid_amount NUMBER,
                           p_customer_payment_method VARCHAR2, p_test out  varchar2); 
                           

 


end Glovo_app_management_PCK;
/
create or replace package body Glovo_app_management_PCK is
--------------CUSTOMERS_DATA Table _adding info 
 procedure Add_CUSTOMERS_DATA (p_full_name VARCHAR2,
                              p_bank_account VARCHAR2,
                              p_email VARCHAR2,
                              p_address VARCHAR2, p_test out  varchar2)is 
                              
  begin
  p_test:= 'Insert_info';
 insert into CUSTOMERS_DATA (full_name,bank_account,email,address) values (p_full_name,p_bank_account,p_email,p_address);
 commit; 
 exception
 when others then 
   p_test:= 'already_exist';
  end;
-------------RESTAURANTS_DATA Table _adding info 
procedure Add_RESTAURANTS_DATE  (
                              p_address        VARCHAR2,
                              p_legal_name   VARCHAR2,
                              p_tax_id         NUMBER,
                              p_bank_account   VARCHAR2,
                              p_email          VARCHAR2,
                              p_working_hours  VARCHAR2,
                              p_commission_fee varchar2,  p_test out  varchar2)is 
                            
                               
  Begin
   p_test:= 'Insert_info';  
 insert into restaurants_data
  ( address, legal_name, tax_id, bank_account, email, working_hours, commission_fee)
values
  ( p_address, p_legal_name, p_tax_id, p_bank_account, p_email, p_working_hours, p_commission_fee);
commit; 
 exception
 when others then 
   p_test:= 'already_exist';
  end;
-------------------COURIERS_DATA  Table_adding info
 procedure Add_COURIERS_DATA  ( p_full_name     VARCHAR2,
                               p_personal_n    NUMBER,    
                               P_phone_number  NUMBER,
                               p_starting_date DATE,
                               p_trasporttype  VARCHAR2,
                               p_IBAN_NUM VARCHAR2, p_test out  varchar2) is 
   Begin
     p_test:= 'Insert_info';
       
     insert into couriers_data
  (full_name, personal_n, phone_number, starting_date, trasporttype, IBAN_NUM)
   values
  ( p_full_name, p_personal_n, p_phone_number, p_starting_date, p_trasporttype, p_iban_num);
commit; 
 exception
 when others then 
   p_test:= 'already_exist';
     end; 
--------------------PRODUCTS Table_adding info              
procedure Add_PRODUCTS (p_restaurand_id NUMBER,
                        p_product_name  VARCHAR2,
                        p_price  NUMBER ,p_test out  varchar2)IS 
     Begin
     p_test:= 'Insert_info';
     insert into products
  ( restaurand_id, product_name, price)
values
  ( p_restaurand_id, p_product_name, p_price);
     
     commit; 
 exception
 when others then 
   p_test:= 'already_exist';
     end; 
   
------------------ORDERS_DATA Table_adding info
procedure Add_ORDERS_DATA (p_creation_time  DATE default sysdate,
                           p_pickup_time   DATE,
                           p_delivery_time DATE, 
                           p_delivery_fee  NUMBER,
                           p_courier_id  NUMBER,
                           p_customer_id  NUMBER,
                           p_order_status  VARCHAR2,
                           p_paid_amount NUMBER,
                           p_customer_payment_method VARCHAR2, p_test out  varchar2) is 
                           
                                                               
   Begin
      p_test:= 'Insert_info';
  insert into orders_data
  ( creation_time, pickup_time, delivery_time, delivery_fee, courier_id, customer_id, order_status, paid_amount, customer_payment_method)
values
  ( sysdate, p_pickup_time, p_delivery_time, p_delivery_fee, p_courier_id, p_customer_id, p_order_status, p_paid_amount, p_customer_payment_method);    
   
     commit; 
 exception
 when others then 
   p_test:= 'already_exist';
     end; 
     
end Glovo_app_management_PCK;
/
