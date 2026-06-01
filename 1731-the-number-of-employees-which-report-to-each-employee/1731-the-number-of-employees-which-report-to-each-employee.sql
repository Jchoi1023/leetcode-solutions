# Write your MySQL query statement below

# manager who has at least 1 other employee
# ids, names of manager, the number of employees who report directly to them, 
# average age of the reports rounded to the nearst integer.

select e1.employee_id, e1.name,
count(e2.employee_id) as reports_count, round(avg(e2.age),0) as average_age
from employees e1
left join employees e2 on e1.employee_id = e2.reports_to
where e2.reports_to is not null
group by e2.reports_to
order by e1.employee_id
