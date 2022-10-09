select e.last_name ,e.hire_date,e.salary,to_char(add_months(next_day(e.hire_date,'monday'),6),'day, ddspth "of" month, yyyy')
from employees e 
