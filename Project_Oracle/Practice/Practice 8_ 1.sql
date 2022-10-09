select  distinct  e.department_id
from employees e
where e.job_id<>'ST_CLERK'
order by  e.department_id asc 

--------------------- set operatori rom gamoviyeno

select distinct department_id
from employees e
minus ---------set operatori

select distinct department_id
from employees e
where e.job_id='ST_CLERK'
