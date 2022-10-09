
select e.department_id, last_name,e.job_id
from employees e
where e.department_id= ( select d.department_id from departments d where d.department_name='Executive')
