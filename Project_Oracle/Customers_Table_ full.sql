-- Create table
create table COURIERS_DATA
(
  courier_id    NUMBER not null,
  full_name     VARCHAR2(30),
  personal_n    NUMBER(11),
  phone_number  NUMBER,
  starting_date DATE,
  trasporttype  VARCHAR2(20),
  iban          VARCHAR2(22)
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
alter table COURIERS_DATA
  add constraint COURIERS_DATA_PK primary key (COURIER_ID)
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
alter table COURIERS_DATA
  add constraint COURIERS_DATA_UQ unique (PERSONAL_N, IBAN)
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
-- Create/Recreate check constraints 
alter table COURIERS_DATA
  add constraint IBAN_NUMBER
  check (LENGTH(IBAN)<= 22);
alter table COURIERS_DATA
  add constraint PIRADI_NOMERI
  check (PERSONAL_N = 11);
