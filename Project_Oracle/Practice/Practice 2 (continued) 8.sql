select last_name, e.job_id ---- e.manager_id, e.employee_id
from employees e
where e.manager_ID is null
