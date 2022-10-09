-- Create table
create table RESTAURANTS_DATA
(
  restaurant_id  NUMBER,
  address        VARCHAR2(30),
  legal_name     VARCHAR2(20),
  tax_id         NUMBER,
  bank_account   VARCHAR2(50),
  email          VARCHAR2(30),
  working_hours  VARCHAR2(5),
  commission_fee NUMBER
)
----------------------------
create or replace trigger Restaurants_Data_tr
  before insert
  on RESTAURANTS_DATA 
  for each row
declare
begin
  :new.restaurant_id:=restaurants_data_seq.nextval;
end Restaurants_Data_tr;
-------------------------------------
-- Create sequence 
create sequence RESTAURANTS_DATA_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;
