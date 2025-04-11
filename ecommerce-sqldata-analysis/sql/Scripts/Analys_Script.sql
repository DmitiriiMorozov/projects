select 
	p.name as product_name,
	SUM(oi.quantity) as total_quantity
from order_items oi
join products p on oi.product_id = p.product_id
group by p.name
order by total_quantity desc
limit 5;

select 
	COUNT(*) as customers_with_more_than_3_orders
from (
	select customer_id
	from orders
	group by customer_id
	having COUNT(order_id) > 3
) as sub;

select 
	c.name as category_name,
	AVG(oi.price * oi.quantity) as average_check
from order_items oi 
join products p on oi.product_id = p.product_id
join categories c on p.category_id = c.category_id
group by c.name; 

select
	reason,
	count(*) as count
from returns
group by reason
order by count desc;

SELECT 
    FLOOR(order_date / 100) AS month,
    SUM(oi.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

select
	payment_method,
	count(*) as count
from payments
group by payment_method
order by count desc;

SELECT DISTINCT o.order_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN returns r ON oi.order_item_id = r.order_item_id;

SELECT 
    SUM(oi.price * oi.quantity) AS total_revenue,
    COALESCE(SUM(oi.price), 0) AS total_returns,
    SUM(oi.price * oi.quantity) - COALESCE(SUM(oi.price), 0) AS net_profit
FROM order_items oi
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
WHERE r.return_id IS NOT NULL;
