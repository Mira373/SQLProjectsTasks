select e.last_name ,e.hire_date,e.salary,to_char(next_day(add_months(e.hire_date,6), 'Monday'),'Day, ddspth "of" month, yyyy')
from employees e 
