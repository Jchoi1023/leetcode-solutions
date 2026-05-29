# Write your MySQL query statement below

# average experience years of all employees for eachproject

select p.project_id,  round(avg(e.experience_years),2) as average_years
from project p
left join employee e on p.employee_id = e.employee_id
group by p.project_id