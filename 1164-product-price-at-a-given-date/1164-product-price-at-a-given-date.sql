# Write your MySQL query statement below

# price changed before 2019-08-16 
# changed after 2019-08-16, then 10

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY product_id
               ORDER BY change_date DESC
           ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
) 

select product_id, new_price as price
from cte
where rn = 1 

UNION

select product_id, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16'