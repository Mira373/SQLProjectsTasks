select e.last_name, e.hire_date
from employees e
where e.department_id=(select e.department_id
from employees e
where lower(e.last_name)='&zlotkey');
----------------------------------subqueri rasac abrunebs realurad aris 80
select e.last_name, e.hire_date
from employees e
where e.department_id=80
