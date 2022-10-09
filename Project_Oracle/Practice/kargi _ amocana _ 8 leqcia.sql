SELECT e.employee_id, e.last_name, e.salary, e.department_id,
 (SELECT trunc(avg(salary)) FROM employees WHERE department_id=e.department_id)avgsal ----- e ar icis ra aris am selectsh amitom am selects calke mnishvneloba ar aqvs 
  FROM employees e; 


SELECT e.employee_id, e.last_name, e.salary, e.department_id,
 (SELECT trunc(avg(salary)) FROM employees WHERE department_id=90)avgsal ---aq erti mnishvnelobistvis mushaobs marto magram pirvelad rac gviweria is yvealstvis mushaobs da kargia magitom 
 
  FROM employees e;
  
  SELECT trunc(avg(salary)) FROM employees WHERE department_id=90
