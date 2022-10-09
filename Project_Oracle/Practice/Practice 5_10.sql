SELECT count (e.employee_id), e.hire_date
FROM employees e
group by employee_id, hire_date
having e.hire_date like '%03' or  e.hire_date like '%07' or e.hire_date like '%08'





