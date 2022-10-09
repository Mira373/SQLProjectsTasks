select trunc(e.salary/100),  substr(e.last_name,1,8), Length(E.last_name),rpad(substr(e.last_name,1,8),trunc(e.salary/100)+ Length(E.last_name),'*')
from employees e
