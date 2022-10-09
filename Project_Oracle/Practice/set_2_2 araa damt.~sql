2. ----------დაასელექთეთ ყველა თანამშრომელი, რომელთა ხელფასიც მეტია იმ დეპარტამენტის საშუალო ხელფასსზე, რომელშიც მუშაობს ყველაზე დაბალხელფასიანი თანამშრომელი.
გარდა ამისა, არ უნდა მუშაობდნენ არც დეპარტამენტ 'Finance'-ში და არც 'Marketing'-ში და მათი დეპარტამენტისთვის "STATE_PROVINCE" არ უნდა იყოს უცნობი,
ასევე მათი მენეჯერის ხელფასი უნდა აღემატებოდეს 10000-ს.
დაბეჭდეთ ველები: გვარი და პოზიცია(job_id) ერთ ველად მათ შორის '_' სიმბოლოთი;
დასაქმების თარიღი შემდეგი სახით: მაგ.'11-OCTOBER-2001';
სამუშაოს დაწყებიდან გასული კვარტლების რაოდენობა (მთელ რიცხვებამდე დამრგვალებული მათემატიკური წესით);
მიმდინარე პოზიციაზე დ--ანიშვნის წელს გამომუშავებული ჯამური ხელფასი (employees-ში წერია მიმდინარე პოზიცია და ამ პოზიციაზე მუშაობის დაწყებიდან არსებული ხელფასი უცვლელად).

select e.last_name|| '_' ||e.job_id, to_char(a.hire_date,'fmdd-month-yyyy'),round(months_between(sysdate, e.Hire_date)/3,0), (12-to_char(e.hire_date, 'mm')+1)*e.salary--mimdinare tvec chavtvalet)
from employees e 
left join employees a
on e.manager_id=a.employee_id
left join departments d
on d.department_id=e.department_id
left join locations l
on l.location_id=d.location_id
where e.salary>(
select avg(salary) from employees where department_ID=(select department_ID from employees  where salary=(select min(salary)from employees)))
and e.job_id not in ('Finance', 'Marketing') and a.salary>10000 and l.state_province  is not null; 

-----------pirveli winandadebis amonaxsni 
select * from employees where salary>(
select avg(salary) from employees where department_ID=(select department_ID from employees  where salary=(select min(salary)from employees)))



