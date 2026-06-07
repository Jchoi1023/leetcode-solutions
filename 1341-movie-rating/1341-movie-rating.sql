# Write your MySQL query statement below

# need to find the user who has rated the greatest number of movies
# need to fine movie name with the highest average rating in February 2020

# first, I need to join the tables.
with cte as (
select m.movie_id, m.title, u.user_id, u.name,
mr.rating, mr.created_at
from movies m
left join movierating mr on m.movie_id = mr.movie_id
left join users u on u.user_id = mr.user_id
),

user_result as (
select name as results
from cte
group by user_id
order by count(movie_id) desc, name asc
limit 1
),

movie_result as (
    select title as results
    from cte
    where created_at between '2020-02-01' and '2020-02-29'
    group by movie_id
    order by avg(rating) desc, title asc
    limit 1
)

select results from user_result
UNION ALL
select results from movie_result
