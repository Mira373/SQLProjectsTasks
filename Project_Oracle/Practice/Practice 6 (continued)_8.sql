select e2.last_name, e2.hire_date
from employees e1
cross join employees e2
where e1.last_name='Davies' and e2.hire_date > e1.hire_date;

--------e1 last nameshi sul davies myavs da agar minda rom gamovitano arc unda iyos eg cxrilshi merve leqcia pirveli nawili

select e1.last_name, e1.hire_date,  e2.last_name, e2.hire_date
from employees e1
cross join employees e2
where e1.last_name='Davies' and e2.hire_date > e1.hire_date

----subquerebit amonaxsni bevrad martvia da barem davwer 
select * 
from emloyees e 
where e.hire_date> ( select hire_date from employees where last_name='Davies')
