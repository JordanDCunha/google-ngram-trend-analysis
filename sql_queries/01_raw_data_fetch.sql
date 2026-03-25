/* STEP 1: RAW DATA EXTRACTION
Project: Google Ngram Trend Analysis
Description: This script extracts the raw annual frequency for the terms 
'television' and 'internet' from the Google Books 2020 1-gram dataset.
*/

SELECT
  term,
  y.year,
  y.term_frequency
FROM
  `bigquery-public-data.google_books_ngrams_2020.eng_1` AS n
CROSS JOIN
  -- Unnesting the years array to transform the nested record into a flat table
  UNNEST(n.years) AS y
WHERE
  term IN ('television', 'internet')
  -- Filtering for the modern era (Post-WWII) to focus on the rise of electronic media
  AND y.year >= 1945
ORDER BY
  y.year ASC, 
  term ASC;
