select last_name
from employees e
where e.last_name like '%a%' || '%e%'
