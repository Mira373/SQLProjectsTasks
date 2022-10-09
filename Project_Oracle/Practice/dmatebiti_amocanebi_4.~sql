4. გამოიტანეთ თანამშრომლების სახელი, გვარი, პოზიცია, ხელფასი, დეპატრადეპარტამენტის ნომერი, დეპარტამენტის დასახელება, ქალაქი და ქვეყანა
ასევე მისი მენეჯერის სახელი, გვარი და პოზიცია, ისეთი თანამშრომლებისთვის რომლებიც
თავის დეპარტამენტში საშუალო ხელფასზე მეტს გამოიმუშავებენ (სელექთსი უნდა ჩანდეს ყველა თანამშრომელი, მათ შორის ისეთები ვისაც მენეჯერი არ ყავს).
დაასორტირეთ ხელფასის მიხედვით კლებადობით.



select  e.first_name, e.last_name, e.job_id, e.salary, e.department_id, d.department_name,l.city, l.country_id, e2.first_name, e2.last_name, e2.job_id
from employees e 
left join ( select department_id, avg(salary) avggg   from employees 
group by department_ID) t
on e.department_id=t.department_id
left join departments d
on e.department_id=d.department_id
join locations l
on l.location_id=d.location_id
left join employees e2
on e.manager_id=e2.employee_id
where e.salary>t.avggg ---- aq rom gadmovitane avg(salary)  marto aar imushavebs  radgan goup functioni whereshi ver mushaobs 

------------- igive sxvanairad
select  e.first_name, e.last_name, e.job_id, e.salary, e.department_id, d.department_name,l.city, l.country_id, e2.first_name, e2.last_name, e2.job_id
from employees e 
left join departments d
on e.department_id=d.department_id
join locations l
on l.location_id=d.location_id
left join employees e2
on e.manager_id=e2.employee_id
where e.salary>(select avg(salary) from employees where department_ID=e.department_id )
