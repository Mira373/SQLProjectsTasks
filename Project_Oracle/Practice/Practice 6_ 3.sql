select e.last_name,e.job_id, d.department_id,d.department_name
from employees e
left join departments d
on e.department_id=d.department_id
left join locations l
on d.location_id=l.location_id
where lower(l.city)='toronto'










