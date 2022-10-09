select e.employee_id, e.last_name
from employees e 
where lower(e.last_name) like '%u%'and e.department_id in (select distinct  e.department_id from employees e );

--------------------------------------------------- etnair pasuxebs ar madzlevs cxrilshi 

select e.employee_id, e.last_name
from employees e 
where  e.department_id in (select distinct  e.department_id from employees e where lower(e.last_name) like '%u%')

