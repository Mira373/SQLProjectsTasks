SELECT  e.job_id, count(*)
FROM employees e
group by e.job_id
having count(e.job_id)>1;

SELECT  e.job_id, count(*)
FROM employees e
group by e.job_id
having e.job_id='&jobtitle'


