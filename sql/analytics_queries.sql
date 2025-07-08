-- Before optimization: Slow query
SELECT c.name, SUM(t.quantity * p.price) as total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN products p ON t.product_id = p.product_id
WHERE t.transaction_date >= '2025-01-01'
GROUP BY c.name
ORDER BY total_spend DESC
LIMIT 10;

-- After optimization: Added index and used read replica
CREATE INDEX idx_customer_transaction ON transactions(customer_id, transaction_date);
SET SESSION aurora_replica_read_consistency = 'SESSION';

-- Optimized query
SELECT /*+ READ_FROM_REPLICA */ c.name, SUM(t.quantity * p.price) as total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN products p ON t.product_id = p.product_id
WHERE t.transaction_date >= '2025-01-01'
GROUP BY c.name
ORDER BY total_spend DESC
LIMIT 10;

-- Analyze with EXPLAIN
EXPLAIN SELECT c.name, SUM(t.quantity * p.price) as total_spend
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN products p ON t.product_id = p.product_id
WHERE t.transaction_date >= '2025-01-01'
GROUP BY c.name
ORDER BY total_spend DESC
LIMIT 10;
