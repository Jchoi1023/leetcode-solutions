# Write your MySQL query statement below

select
CASE WHEN id % 2 = 1 AND id != (select max(id) from seat) THEN id + 1
    WHEN id % 2 = 0 THEN id - 1 ELSE id END
     AS id,
     student
from seat
order by id
