select distinct  e.job_id, e.department_id
from employees e 
where e.department_id in ( 10, 50, 20) ;


----------------
select distinct  e.job_id, e.department_id
from employees e 
where e.department_id =10
union all
select distinct  e.job_id, e.department_id
from employees e 
where e.department_id =50
union all
select distinct  e.job_id, e.department_id
from employees e 
where e.department_id =20
