select   employee_id,job_id
from employees e 
intersect
select   employee_id,job_id
from Job_history
