# Write your MySQL query statement below
SELECT s.name
FROM salesperson s
WHERE s.name NOT IN (
  SELECT s.name
  FROM orders o
  JOIN company c ON c.com_id = o.com_id
  join salesperson s on s.sales_id = o.sales_id
  WHERE c.name = 'RED'
);
