select   e.last_name, e.department_id, null department_name
from employees e 
union all
select null,  d.department_id, d.department_name
from departments d
