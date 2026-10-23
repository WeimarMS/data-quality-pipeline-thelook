-- Finds rows in orders that repeat an existing order_id.
SELECT
  'duplicate_orders' AS check_name,
  COUNT(*) - COUNT(DISTINCT order_id) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE order_id IS NOT NULL
