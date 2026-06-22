# Write your MySQL query statement below

# find the name of the user who has rated the greatest number of movies
# find the movie name with the highest average rating in Feb 2020.

with cte as (
    select m.movie_id, m.title, u.user_id, u.name, mr.rating, mr.created_at
    from movies m
    left join movierating mr on m.movie_id = mr.movie_id
    left join users u on u.user_id = mr.user_id
),
greatest_number as (
  select name as results, count(*) as count
from cte
group by name 
order by count desc, name asc
limit 1
),
highest_avg as (
select title as results, avg(rating) as average
from cte
where created_at between '2020-02-01' and '2020-02-29'
group by title
order by average desc, title asc
limit 1
)


select results from greatest_number

UNION ALL

select results from highest_avg


