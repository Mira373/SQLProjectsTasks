SELECT  job_id, 
sum(case when e.department_id=20 then  salary else 0  end)  "dep 20", 
sum(case when e.department_id=50 then  e.salary else 0 end) "dep 50",
sum ( salary ) "total"
FROM employees e
group by  job_id






