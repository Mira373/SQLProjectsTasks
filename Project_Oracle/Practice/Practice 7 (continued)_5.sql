select e2.last_name, e2.salary
from employees e1
join employees e2
on e1.employee_id=e2.manager_id
where e1.last_name=(select last_name from employees where manager_id is not null and last_name='King'); 
----------------meore nairad 
select last_name,salary
from employees e
where manager_ID in (select employee_ID from employees where last_name='King'); 
------------------------------------------------------------------------------- es araperia qvevit 
select e.employee_id,e.last_name,e m.manager_id,m.last_name
from employees e 
join employees m
on e.employee_id=m.manager_id;

select e.last_name,e.employee_id,e.manager_id
from employees e; 

SELECT worker.last_name emp,manager.last_name mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);
