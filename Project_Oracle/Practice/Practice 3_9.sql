select e.last_name,trunc((SYSDATE-hire_date)/7, 0) AS tenure
from employees e
where e.department_id=90
order by tenure desc
