select last_name "employee", salary "monthly_salary"
from employees e
where (e.salary between 5000 and 12000) and (e.department_ID = 20 or e.department_ID=50);-- e.department_ID in ( 20, 50 ) 


select last_name "employee", salary "monthly_salary"
from employees e
where (e.salary between 5000 and 12000) and e.department_ID in ( 20, 50 )
