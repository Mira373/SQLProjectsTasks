select length(initcap(e.last_name))
from employees e
where substr(e.last_name,1, 1) in ('&H')
