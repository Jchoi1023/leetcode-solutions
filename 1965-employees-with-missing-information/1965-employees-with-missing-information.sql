# Write your MySQL query statement below
(select e.employee_id from employees e
left join salaries s on e.employee_id = s.employee_id
where s.salary is NULL
union
SELECT s.employee_id
FROM employees e
RIGHT JOIN salaries s on e.employee_id = s.employee_id
where e.name is null)
order by employee_id asc;

