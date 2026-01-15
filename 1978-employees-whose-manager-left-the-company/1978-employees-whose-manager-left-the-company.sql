# Write your MySQL query statement below
-- select e.employee_id from employees e
-- where e.salary < 30000 and e.manager_id is not null
-- and not exists (
--     select 1
--     from employees m
--     where m.employee_id = e.manager_id
-- )

select e.employee_id
from employees e
left join employees m on m.employee_id = e.manager_id
where m.employee_id is null and e.salary < 30000 and e.manager_id IS NOT NULL
order by e.employee_id asc;

-- select *
-- from employees e
-- left join employees m on m.employee_id = e.manager_id