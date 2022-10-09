
select e.employee_id, last_name, e.job_id
  from employees e
 where e.department_id in
       (select distinct department_ID
          from employees
         where lower(last_name) like '%u%')
   and salary > (select avg(salary) from employees)
