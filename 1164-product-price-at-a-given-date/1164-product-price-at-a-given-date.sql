# Write your MySQL query statement below

# need to get the update price before 2019-08-16, Subquery
# price change after 2019-08-16 then the price will be 10 even though it has been changed.

select product_id, new_price as price
from (
    select 
    product_id, 
    new_price,
    ROW_NUMBER() OVER (partition by product_id order by change_date desc) as rn

from products
where change_date <= '2019-08-16' 
) t
where rn = 1
-- SELECT product_id, new_price AS price
-- FROM (
--     SELECT
--         product_id,
--         new_price,
--         ROW_NUMBER() OVER (
--             PARTITION BY product_id
--             ORDER BY change_date DESC
--         ) AS rn
--     FROM Products
--     WHERE change_date <= '2019-08-16'
-- ) t
-- WHERE rn = 1
UNION

SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';