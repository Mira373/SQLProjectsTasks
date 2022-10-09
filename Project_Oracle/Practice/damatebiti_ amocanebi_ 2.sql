2. დაწერეთ სელექთი, რომელიც წამოიღებს ყველა ისეთი თანამშრომელის სახელს, გვარს და დეპარტამენტის ნომერს, რომლის ხელფასიც არის ოთხნიშნა ან ხუთნიშნა და გარდა ამისა ხელფასში ურევია ციფრი 5.
ასევე ამ თანამშრომლებისთვის დათვალეთ, რამდენი ადამიანი მუშაობს მსგავსს პოზიციაზე, მათ მაქსიმალური ხელფასი, მინიმალური და საშუალო ხელფასები და გამოიტანეთ სელექთში.
თუ ეს თანამშრომელი იღებს საკომისიოს გამოიტანეთ ველი რომელშიც იქნება შემდეგი სახის ინფორმაცია: 

თანამშრომლის სახელი - სფეისი - გვარი - სფეისი - სიტყვა "earns a" - სფეისი - საკომისიოს პროცენტის მნიშვნელობა - სიმბოლო % - სფეისი - სიტყვა "commission".
მაგ.: George Bush Earns a 15% commission
თუ ეს თანამშრომელი არ იღებს საკომისიოს გამოიტანეთ "--"


select e.last_name,
       e.first_name,
       e.department_id,
       nvl2(e.commission_pct,
            e.first_name || ' ' || E.LAST_NAME || 'earns a' ||
            commission_pct || ' % commission',
            '__')
  from employees e
  join (select Job_ID,
               count(employee_id) emp_NUM,
               max(salary) maxim,
               min(salary) mini,
               avg(salary) av_sal
          from employees ---- es ukve aris table da amas gadavitant joinshi 
         group by job_id) t
    on t.Job_ID = e.job_id
 where length(salary) in (4, 5)
   and salary like '%5%' ----instr( salary , '5')>0 anu arsebobs sadgac da ragac pozicia ukavia


select count(employee_id), max(salary ), min( salary ) , avg( salary ) from employees  ---- es ukve aris table da amas gadavitant joinshi 
 group by job_id 
 
