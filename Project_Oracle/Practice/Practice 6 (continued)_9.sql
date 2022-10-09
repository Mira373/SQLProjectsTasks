select  e1.last_name, e1.hire_date, e2.last_name, e2.hire_date
from employees e1
left join employees e2
on e1.manager_id=e2.employee_id
where e1.hire_date< e2.hire_date
