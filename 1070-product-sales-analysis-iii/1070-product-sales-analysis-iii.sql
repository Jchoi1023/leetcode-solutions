# Write your MySQL query statement below

  SELECT product_id, year as first_year, quantity, price
    FROM (
        SELECT *,
               Dense_rank() OVER (
                   PARTITION BY product_id 
                   ORDER BY year
               ) AS rnk
        FROM sales
    ) t
    WHERE rnk = 1
  