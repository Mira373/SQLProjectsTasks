SELECT  e.job_id, round(avg(salary),0) "Average", Round ( MAX(salary), 0) "Maximum", round (MIN(salary),0 ) "Minimum", sum(salary) 
FROM employees e
group by e.job_id

