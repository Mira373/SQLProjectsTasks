-- Create table
create table RESTAURANTS_DATA
(
  restaurant_id  NUMBER not null,
  address        VARCHAR2(30),
  legal_name     VARCHAR2(20),
  tax_id         NUMBER,
  bank_account   VARCHAR2(50),
  email          VARCHAR2(30),
  working_hours  VARCHAR2(5),
  commission_fee varchar2 (5)
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
alter table RESTAURANTS_DATA
  add constraint RESTAURANTS_DATA_PK primary key (RESTAURANT_ID)
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
alter table RESTAURANTS_DATA
  add constraint RESTAURANTS_DATA_UQ unique (BANK_ACCOUNT, TAX_ID, LEGAL_NAME)
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
