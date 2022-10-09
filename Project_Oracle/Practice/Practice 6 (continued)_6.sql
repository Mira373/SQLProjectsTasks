select   e.last_name, e.department_id, d.last_name
from employees e
left join employees d 
on e.department_id=d.department_id
where e.employee_id<>d.employee_id
---- meshvide leqci apirveli nawili 









