-- Finds orders shipped before they were created, delivered before they were shipped, or returned before they were delivered.
SELECT
  'impossible_dates' AS check_name,
  COUNT(*) AS problem_rows
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE shipped_at   < created_at
   OR delivered_at < shipped_at
   OR returned_at  < delivered_at
