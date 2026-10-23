-- Finds rows with nulls in key fields of orders (order_id, user_id, status, created_at) and order_items (id, order_id, product_id, sale_price).
SELECT
  'nulls_in_key_fields' AS check_name,
  (SELECT COUNT(*)
     FROM `bigquery-public-data.thelook_ecommerce.orders`
    WHERE order_id IS NULL OR user_id IS NULL OR status IS NULL OR created_at IS NULL)
  +
  (SELECT COUNT(*)
     FROM `bigquery-public-data.thelook_ecommerce.order_items`
    WHERE id IS NULL OR order_id IS NULL OR product_id IS NULL OR sale_price IS NULL)
  AS problem_rows
