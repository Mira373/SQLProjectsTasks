select  last_name, e.department_ID
from employees e
where e.department_id in (20,50)
order by e.first_name asc
