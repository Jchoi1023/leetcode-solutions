# Write your MySQL query statement below
select e.name as Employee from employee e
left join employee ee on e.managerId = ee.id
where e.salary > ee.salary