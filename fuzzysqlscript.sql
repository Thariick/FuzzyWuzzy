USE DATABASE FUZZYCHALLENGE;

--Getting total sales
SELECT
    SUM(amount) AS total_sales
FROM
    fuzzywuzzydata
WHERE
    transaction_date BETWEEN '2023-01-01' AND '2023-12-31';

--Customer segmentation
SELECT
    customer_id,
    COUNT(DISTINCT customer_name) AS num_customers,
    SUM(amount) AS total_sales
FROM
    fuzzywuzzydata
WHERE
    transaction_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    customer_id;

--Product purchase per customer and total
SELECT
    customer_name,
    COUNT(*) AS num_purchases,
    SUM(amount) AS total_sales
FROM
    fuzzywuzzydata
WHERE
    transaction_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    customer_name
ORDER BY
    total_sales DESC;

--Trend
SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(amount) AS monthly_sales
FROM
    fuzzywuzzydata
WHERE
    transaction_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    month
ORDER BY
    month;




