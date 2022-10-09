SELECT  e.job_id,sum(e.salary), e.department_id
FROM employees e
group by   e.department_id, salary, e.job_id
having e.department_id in ( 20, 50, 80, 90);




