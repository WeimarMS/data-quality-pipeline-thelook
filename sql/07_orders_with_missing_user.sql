-- Finds orders with a non-null user_id that does not exist in users.id.
SELECT
  'orders_with_missing_user' AS check_name,
  COUNT(*) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.orders` o
WHERE o.user_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM `bigquery-public-data.thelook_ecommerce.users` u
    WHERE u.id = o.user_id
  )
