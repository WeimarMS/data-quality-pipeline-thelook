-- Finds orders where num_of_item does not match the actual number of rows in order_items.
SELECT
  'item_count_mismatch' AS check_name,
  COUNT(*) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.orders` o
LEFT JOIN (
  SELECT order_id, COUNT(*) AS actual_items
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY order_id
) oi ON oi.order_id = o.order_id
WHERE o.num_of_item IS DISTINCT FROM COALESCE(oi.actual_items, 0)
