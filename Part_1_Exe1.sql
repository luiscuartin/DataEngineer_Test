SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM
    Customers c
JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    o.order_date >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    total_spent DESC;

/*To optimize this query, I would ensure that an index on Customer_id is already created 
since it is the primary key, and create an index on Orders.order_date
 since the query filters by it.*/

CREATE INDEX idx_orders_customer_date ON Orders(order_date);


