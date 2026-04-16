# Write your MySQL query statement below
with cnt as (
    select num, count(num) as countnumber
    from mynumbers
    group by num
)

select max(num) as num from cnt
where countnumber = 1;