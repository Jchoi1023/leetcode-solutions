# Write your MySQL query statement below
# author_id = viewer_id
# count(author_id) >= 1


with cnt as (
    select 
        count(author_id),
        author_id,
        viewer_id
    from views
    group by author_id, viewer_id
)

select 
    distinct author_id as id
from views
where author_id = viewer_id
order by id asc;
