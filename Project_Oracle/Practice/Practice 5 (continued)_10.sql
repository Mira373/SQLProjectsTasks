SELECT count(*),
sum((case when to_char(trunc(e.hire_date), 'YYYY')='2003' THEN 1 else 0 end)) "2003", 
sum((case when to_char(trunc(e.hire_date), 'YYYY')='2005' THEN 1 else 0 end)) "2005"
FROM employees e






