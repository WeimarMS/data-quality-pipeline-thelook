-- Finds order_items rows with a non-null product_id that does not exist in products.
SELECT
  'items_with_missing_product' AS check_name,
  COUNT(*) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON p.id = oi.product_id
WHERE p.id IS NULL
  AND oi.product_id IS NOT NULL
