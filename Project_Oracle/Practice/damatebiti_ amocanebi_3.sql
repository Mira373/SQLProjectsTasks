3. დაასელექთეთ ყველა თანამშრომელი, რომელთა ხელფასი სულ ცოტა 2000 ლარით მეტია კომპანიაში არსებული მინიმალურ ხელფასზე, 
გარდა ამისა, არ უნდა მუშაობდნენ დეპარტამენტ „Executive“-ში და მათი დეპარტამენტი არ უნდა მდებარეობდეს „Los Angeles“-ში, 
ასევე მათი მენეჯერი არ უნდა იყოს არც „Abel“ და არც „Nelson“.
დაბეჭდეთ ველები: სახელი და გვარი გადაბმულად მათ შორის 1 ცარიელი სიმბოლოთი; 
დასაქმების თარიღი შემდეგი სახით: „dd/mm/yyyy“; 
სამუშაოს დაწყებიდან გასული თვეების რაოდენობა (მთელ რიცხვებამდე დამრგვალებული მათემატიკური წესით); 
მიმდინარე წელს (მიმდინარე თვის ჩაუთვლელად) მათი გამომუშავებული ჯამური ხელფასი 
(გამოიყენეთ sysdate, ისე რომ რეპორტი იყოს დინამიური და ნებისმიერ გაშვებაზე დათვალოს მიმდინარე წლის ინფორმაცია);


select e.last_name||' '||e.first_name full_name , to_char( e.hire_date, 'dd/mm/yyyy'), round(months_between( sysdate,e.hire_date),0) months ,(to_char( sysdate,'mm')-1)*e.salary salary
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id = l.location_id
join employees e2
on e.employee_ID=e2.manager_ID
where e.salary > (select min(e.salary) from employees e)+2000
and d.department_name <> 'Executive'
and l.city <> 'London' 
and e2.last_name not in ('Abel','Nelson')

-----------(select d.department_name
         ---- from departments d
        ------  join locations l
          -------  on d.location_id = l.location_id
        ------ where d.department_name <> 'Executive'
        -----   and l.city <> 'London')
