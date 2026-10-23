-- Finds orders in orders that have no rows in order_items.
SELECT
  'orders_without_items' AS check_name,
  COUNT(*) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.orders` o
WHERE NOT EXISTS (
  SELECT 1
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  WHERE oi.order_id = o.order_id
)
