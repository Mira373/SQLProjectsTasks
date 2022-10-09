select e.job_ID,decode(e.job_id, 'AD_PRES','A','ST_MAN','B',0)
from employees e ;

select job_ID, 
case 
when job_id= 'AD_PRES' then
  'A'
  when job_id='ST_MAN' then 
    'B'
    else 
      '0'
      end 
      "Grade"
      from employees
  



