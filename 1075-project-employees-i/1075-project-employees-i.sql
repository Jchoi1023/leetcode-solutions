# Write your MySQL query statement below
with new_table as (
    select p.project_id as project_id, e.experience_years as years, e.name as name
    from project p
    left join employee e on p.employee_id = e.employee_id
)

select project_id, round(sum(years)/count(name),2) as average_years
from new_table
group by project_id