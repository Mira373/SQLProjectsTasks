select Emp.last_name,Emp.employee_id, Mgr.employee_id, Mgr.Last_Name
from employees Emp
left join employees Mgr
on Emp.Manager_Id=Mgr.employee_id
order by Emp.Employee_Id










