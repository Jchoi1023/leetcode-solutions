# Write your MySQL query statement below
SELECT e.name as Employee from Employee e
left Join Employee d on d.id = e.managerId
where e.salary > d.salary;

#self join