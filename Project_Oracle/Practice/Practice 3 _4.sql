select  e.salary, last_name, round(((salary+1)*15.5/100),0) "New Salary", (round(((salary+1)*15.5/100),0)-salary) Increase
from employees e 
