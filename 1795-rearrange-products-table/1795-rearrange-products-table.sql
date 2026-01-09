# Write your MySQL query statement below
select product_id, store, price 
from(
   SELECT product_id, 'store1' AS store, store1 AS price
    FROM products
    UNION ALL
    SELECT product_id, 'store2', store2
    FROM products
    UNION ALL
    SELECT product_id, 'store3', store3
    FROM products 
) t
where price is not null;