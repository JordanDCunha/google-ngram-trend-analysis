/* STEP 2: ADVANCED TIME-SERIES ANALYSIS
Project: Google Ngram Trend Analysis
Description: This script calculates Year-over-Year (YoY) growth and 
historical momentum for the terms 'television' and 'internet'.
*/

WITH YearlyCounts AS (
  SELECT
    term,
    y.year,
    y.term_frequency
  FROM
    `bigquery-public-data.google_books_ngrams_2020.eng_1`
  CROSS JOIN
    UNNEST(years) AS y
  WHERE
    term IN ('television', 'internet')
    AND y.year >= 1950
)
SELECT
  term,
  year,
  term_frequency,
  -- WINDOW FUNCTION: LAG() allows us to compare current year to the previous year
  LAG(term_frequency) OVER (PARTITION BY term ORDER BY year) AS prev_year_count,
  
  -- MOMENTUM CALCULATION: (Current - Previous) / Previous * 100
  ROUND(
    SAFE_DIVIDE(
      term_frequency - LAG(term_frequency) OVER (PARTITION BY term ORDER BY year), 
      LAG(term_frequency) OVER (PARTITION BY term ORDER BY year)
    ) * 100, 
  2) AS yoy_growth_pct
FROM
  YearlyCounts
ORDER BY
  year ASC, 
  term ASC;
