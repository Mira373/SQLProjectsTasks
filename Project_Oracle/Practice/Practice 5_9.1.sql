SELECT count (e.manager_id), e.manager_id, e.salary
FROM employees e
group by e.manager_id, salary
