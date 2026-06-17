# Write your MySQL query statement below

# Let me make sure that I understand the problem correctly.
# So I need to find managers with at least five direct reports, right?

-- select name, count(*)
-- from employee 
-- group by managerId
# I'm going to self join the table because the aggregation to show employee name not the manager's name, so to show the manager's name, I'm going to self join the table.

select a1.name
from employee a1
join employee a2 on a1.id = a2.managerId
# I joined with id and managerId so that I can get the employee list with their manager.
group by a2.managerId
having count(a2.id) >= 5