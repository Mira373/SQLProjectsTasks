select e.last_name, salary, e.commission_pct,nvl(to_char(e.commission_pct),'No Commisison') com
from employees e 

