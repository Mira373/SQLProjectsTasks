select e.employee_id, e.last_name, e.salary
from employees e 
where e.salary>(select avg( salary)from employees )
order by 3
