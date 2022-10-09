----sxvadasxva chanaweri gamoaqvs cxrilebshi 
select  * from countries c
left join locations l
on c.country_id=l.country_id
left join departments d
on l.location_id=d.location_id
where d.department_id is null;
-------------
select c.country_id, c.country_name
from countries c
minus
select distinct   c.country_id, c.country_name from departments d
join locations l
on d.location_id=d.location_id
join countries c
on l.country_id=c.country_id
