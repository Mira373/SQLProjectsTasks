select e.last_name  || 'earns ' || salary || ' salary monthly but wants' || to_char (3*salary, '$999,999.00') "D salaryes"
from employees e 
