# Write your MySQL query statement below

# average experience years of all the employees for each project
# group by project_id

# sum experience years / number of employees for the project


select p.project_id,  
round(sum(e.experience_years)/count(e.employee_id),2) as average_years
from project p 
left join employee e on p.employee_id = e.employee_id
group by p.project_id

