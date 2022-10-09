select last_name, e.job_id, e.salary
from employees e
where (job_id= 'SA_REP' or job_id= 'ST_CLERK') AND (salary not in (2500, 3500, 7000))
