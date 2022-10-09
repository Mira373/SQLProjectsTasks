-- Create table
create table ORDERS_DATA
(
  order_code              NUMBER not null,
  creation_time           DATE default sysdate,
  pickup_time             DATE,
  delivery_time           DATE,
  delivery_fee            NUMBER,
  courier_id              NUMBER,
  customer_id             NUMBER,
  order_status            VARCHAR2(10),
  paid_amount             NUMBER,
  customer_payment_method VARCHAR2(5)
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
alter table ORDERS_DATA
  add constraint ORDERS_DATA_PK primary key (ORDER_CODE)
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
