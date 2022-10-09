select  last_name, e.salary, e.commission_pct
from employees e
where e.commission_pct is not null
order by  e.salary desc , e.commission_pct desc;
