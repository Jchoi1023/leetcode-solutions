# Write your MySQL query statement below

# Need to find two differet things
# The name of the user who has rated the greates number of movies
# The movie name with the highest average rating in Feb 2020

# First of all, I need to join all the table to get the data
# Need separate queries for both because two different “top 1” problems with different grouping rules
with cte as(
select 
    m.movie_id,
    m.title,
    u.user_id, 
    u.name,
    mr.rating,
    mr.created_at
from movies m 
left join movierating mr on m.movie_id = mr.movie_id
left join users u on mr.user_id = u. user_id
),

user_result as (
select name as results
from cte
group by user_id
-- having count(*) 
order by count(*) desc, name asc
limit 1
),

movie_result as (
    select title as results
    from cte
    where created_at between '2020-02-01' and '2020-02-29'
    group by title
    order by avg(rating) desc, title asc
    limit  1
)

select results from user_result

UNION ALL

select results from movie_result
