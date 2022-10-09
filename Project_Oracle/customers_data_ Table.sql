-- Create table
create table CUSTOMERS_DATA
(
  customer_id  NUMBER not null,
  full_name    VARCHAR2(30),
  bank_account NUMBER,
  email        VARCHAR2(30),
  address      VARCHAR2(30),
 
)
 
-----------------------

-- Create sequence 
create sequence CUSTOMERS_DATA_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
-----------------------

--- Create Triger
create or replace trigger Customers_Data_tr
  before insert
  on CUSTOMERS_DATA 
  for each row
declare
begin
  :new.customer_id:=customers_data_seq.nextval;
end Customers_Data_tr;

-----------------------
