# Write your MySQL query statement below
select p.product_id, p.product_name from product p
join sales s on s.product_id = p.product_id
group by p.product_id
having max(s.sale_date) between '2019-01-01' and '2019-03-31'
and min(s.sale_date) between '2019-01-01' and '2019-03-31'