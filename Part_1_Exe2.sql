
SELECT
	p.category,
	SUM(od.quantity * od.price) AS total_sales
FROM
	Products p
JOIN
	Order_Details od ON p.product_id = od.product_id
WHERE
	od.order_id IN (SELECT o.order_id FROM orders o
	o.order_date >= '2024-01-01')
GROUP BY
	p.category;

/*Sometimes having multiple JOINs in a query can make it slower,
 so I replaced the JOIN with the Orders table with a subquery that filters
 by o.order_date in the WHERE clause.*/


CREATE INDEX idx_order_date ON Orders(order_date);

/*Make sure there are indexes on the columns used for joins and searches,
 such as product_id in Products and Order_Details, and order_id in Order_Details
 and Orders. Also, create an index on order_date in the Orders table
to speed up the subquery in the WHERE clause.*/
