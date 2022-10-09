

select e.last_name,e.JOB_ID,d.department_name, e.salary
 from employees e
 join departments d 
on e.department_id=d.department_id
join jobs j
on e.salary between j.max_salary and j.max_salary

