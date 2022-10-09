select * 
from employees e
join departments d
on e.department_id=d.department_id and d.manager_id=200  -----where d.manager_id=200 ----- and d.manager_id=200
