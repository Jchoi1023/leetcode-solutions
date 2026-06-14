# Write your MySQL query statement below

with cte as (
    select e.id, e.name as Employee, e.salary as Salary, d.name as Department
    from employee e 
    left join department d on e.departmentid = d.id
),
rolling as(
select Department, Employee, Salary,
dense_Rank() over (partition by Department order by Salary desc) as rn
from cte
)

select Department, Employee, Salary
from rolling
where rn >= 1 and rn <= 3 

