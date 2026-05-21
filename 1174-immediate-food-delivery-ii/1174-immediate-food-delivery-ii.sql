# Write your MySQL query statement below

# pref data = order date -> immediate
# otherwise -> scheduled
# first order -> one first order
# find the percentage of immediate orders in the first orders of all customers
SELECT 
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM Delivery),
        2
    ) AS immediate_percentage
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
) t
WHERE rn = 1
  AND order_date = customer_pref_delivery_date;




