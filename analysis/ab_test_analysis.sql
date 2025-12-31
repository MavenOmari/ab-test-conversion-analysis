-- A/B Test Conversion Analysis
-- Business Question: Did the treatment group convert at a higher rate than the control group?

-- Assumed table: ab_test_data
-- Columns:
--   user_id
--   experiment_group  ('control' or 'treatment')
--   converted         (1 if converted, 0 if not)

-- 1) Quick counts by group
SELECT
  experiment_group,
  COUNT(*) AS total_users,
  SUM(converted) AS total_conversions
FROM ab_test_data
GROUP BY experiment_group;

-- 2) Conversion rate by group
SELECT
  experiment_group,
  COUNT(*) AS total_users,
  SUM(converted) AS total_conversions,
  ROUND(SUM(converted) * 1.0 / COUNT(*), 4) AS conversion_rate
FROM ab_test_data
GROUP BY experiment_group;

-- 3) Lift (treatment - control)
WITH conversion_rates AS (
  SELECT
    experiment_group,
    SUM(converted) * 1.0 / COUNT(*) AS conversion_rate
  FROM ab_test_data
  GROUP BY experiment_group
)
SELECT
  MAX(CASE WHEN experiment_group = 'treatment' THEN conversion_rate END)
  -
  MAX(CASE WHEN experiment_group = 'control' THEN conversion_rate END)
  AS conversion_lift
FROM conversion_rates;
