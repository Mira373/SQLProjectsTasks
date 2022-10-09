-- Create table
create table PRODUCTS
(
  product_id    NUMBER not null,
  restaurand_id NUMBER,
  product_name  VARCHAR2(15),
  price         NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PRODUCTS
  add constraint PRODUCTS_PK primary key (PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCTS
  add constraint PRODUCTS_FK foreign key (RESTAURAND_ID)
  references RESTAURANTS_DATA (RESTAURANT_ID) on delete set null;
