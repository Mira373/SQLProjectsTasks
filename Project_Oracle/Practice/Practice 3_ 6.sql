select round(MONTHS_BETWEEN (sysdate, hire_date)) MONTHS_WORKED
from employees 
order by  MONTHS_BETWEEN (sysdate, hire_date)
