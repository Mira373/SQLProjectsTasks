select e.employee_id, e.salary, last_name, round(((salary+1)*15.5/100),0) "New Salary"
from employees e 
