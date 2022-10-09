გამოიტანეთ თანამშრომლების სახელი, გვარი, პოზიცია, ხელფასი, დეპატრადეპარტამენტის ნომერი, დეპარტამენტის დასახელება, ქალაქი და ქვეყანა
ასევე მისი მენეჯერის გვარი და პოზიცია, ისეთი თანამშრომლებისთვის, რომლებიც მსგავს პოზიციაზე (იმავე JOB_ID-ზე) არსებულ საშუალო ხელფასზე მეტს გამოიმუშავებენ, 
ხოლო თავის დეპარტამენტში ყველაზე მაღალი ხელფასი აქვთ(სელექთსი უნდა ჩანდეს ყველა თანამშრომელი, მათ შორის ისეთები ვისაც მენეჯერი არ ყავს).
დაასორტირეთ ხელფასის კლებადობით მიხედვით.
select e.first_name,
       e.last_name,
       e.job_id,
       e.salary,
       e.department_id,
       d.department_name,
       l.city,
       l.country_id,
       e2.first_name,
       e2.last_name,
       e2.job_id
  from employees e
  left join departments d
    on e.department_id = d.department_id
  join locations l
    on l.location_id = d.location_id
  left join employees e2
    on e.manager_id = e2.employee_id
 where e.salary >
       (select avg(salary) from employees where job_ID = e.job_id)
   and e.salary = (select max(salary)
                      from employees
                     where department_ID = e.department_id)
 order by salary desc
