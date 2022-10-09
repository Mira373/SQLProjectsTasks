select e.last_name, e.department_id, e.job_id
from employees e 
join departments d
on d.department_id=e.department_id
join locations l 
on d.location_id=l.location_id
where l.location_id=1700;

------------------subquerit iqneba ase 
select e.last_name, e.department_id, e.job_id
from employees e 
where e.department_id in (select department_ID from departments where location_id=1700)
