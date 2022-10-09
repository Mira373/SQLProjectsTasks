select * from my_employee;


insert into my_employee
  (id, last_name, first_name, userid, salary)
values
  (2, 'Dancs', 'Betty', 'bdancs', 860)
  
  commit; 
  update my_employee
  set salary=1000
  where salary<900
  commit; 
  
  update my_employee
  set ID=3
  where ID=2
  
  insert into my_employee
    (id, last_name, first_name, userid, salary)
  values
    (4,'Newman', 'Chad', 'cnewman', 750);
  savepoint a;
  

  
  
delete  my_employee
rollback to a;

select * from my_employee;

----insert into my_employee(id, last_name, first_name, userid, salary)  select 1, 'Dancs', 'Betty', 'bdancs', 860 from dual union select 2, 'Petel', 'Ralph', 'rpatel', 895 msgavsia 

insert into my_employee
  (id,last_name,first_name,userid,salary)
values
  (&id, '&last_name','&first_name', Lower(substr('&first_name',1,1)|| substr('&last_name',1,7)),&salary); ---aq userid tavisit dagenerirdeba ukve mecxre tavis davaleba 24
