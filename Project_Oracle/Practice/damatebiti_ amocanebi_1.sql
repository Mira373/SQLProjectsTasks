1. დაასელექთეთ ყველა თანამშრომელი, რომელთა last_name-ც იწყება ‘M’ –ზე ან  ‘C’ –ზე და რომელთა first_name-ის სიგრძე აღემატება 6 სიმბოლოს. 
გარდა ამისა, აუცილებელია, რომ მათ ჰყავდეთ მენეჯერები და მათი დასაქმებიდან გასული იყოს 10 წელი მაინც.
დაბეჭდეთ მათი სახელი; გვარი; წლიური ხელფასი (ფორმატით: $12,500.00); 
ერთი თვის საკომისიო (მისი არარსებობის შემთხვევაში დაბეჭდეთ - 0); 
JOB_ID-ის ‘_’-მდე მოჭრილი მნიშვნელობა (რასაც შეგვიძლია Job_prefix ვუწოდოთ); 
ეს ყველაფერი დაალაგეთ დეპარტამენტების ზრდადობით.




select e.last_name,
       e.last_name,
       e.salary,
       to_char(e.salary, '$999,999.00'),
       nvl(e.commission_pct, 0),
       substr(e.job_id, 1, instr(e.job_id, '_') - 1) Job_prefix
  from employees e
 where (lower(e.last_name) like 'm%' or lower(e.last_name) like 'c%') and manager_ID is not null
   and length(e.first_name) > 6 -----lower(substr(last_name,1,1 )) in ( 'm','c')
   and to_char(sysdate, 'yyyy') - to_char(e.hire_date, 'yyyy') > 10 ----months_ between(sysdate, Hire_date)>=120
 order by e.department_id asc
