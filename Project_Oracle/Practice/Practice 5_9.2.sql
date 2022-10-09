SELECT e.manager_id, min(e.salary)
FROM employees e
group by e.manager_id
having MIN(salary)>6000 and e.manager_id is not null
order by min(salary) desc;

select e.manager_id, min( e.salary)
from employees e
where e.manager_id is not null
group by manager_id
having min( salary)>6000
order by min(salary) desc


