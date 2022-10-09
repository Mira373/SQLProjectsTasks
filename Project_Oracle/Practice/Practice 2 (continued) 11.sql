select  last_name, e.salary, e.employee_id, e.manager_ID,e.department_ID
from employees e
where manager_ID=&manager_num
order by &any_collumn-- any field from selected list 
