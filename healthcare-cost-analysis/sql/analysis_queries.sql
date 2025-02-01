-- analysis_queries.sql

-- 1. Top 10 Drugs by Total Spending in 2022
SELECT 
    brnd_name,
    tot_spndng_2022 as total_spending,
    tot_benes_2022 as total_beneficiaries,
    avg_spnd_per_bene_2022 as spending_per_beneficiary
FROM medicare_spending
WHERE tot_spndng_2022 IS NOT NULL
ORDER BY tot_spndng_2022 DESC
LIMIT 10;

-- 2. Manufacturer Analysis
SELECT 
    mftr_name,
    COUNT(*) as drug_count,
    SUM(tot_spndng_2022) as total_spending_2022,
    SUM(tot_benes_2022) as total_beneficiaries,
    AVG(avg_spnd_per_bene_2022) as avg_cost_per_beneficiary
FROM medicare_spending
GROUP BY mftr_name
ORDER BY total_spending_2022 DESC
LIMIT 10;

-- 3. Year-over-Year Growth Analysis
WITH yearly_totals AS (
    SELECT
        SUM(tot_spndng_2021) as spending_2021,
        SUM(tot_spndng_2022) as spending_2022
    FROM medicare_spending
)
SELECT
    spending_2022,
    spending_2021,
    ((spending_2022 - spending_2021) / spending_2021 * 100) as yoy_growth_percent
FROM yearly_totals;

-- 4. High Cost Drugs Analysis
SELECT 
    brnd_name,
    gnrc_name,
    mftr_name,
    tot_spndng_2022,
    tot_benes_2022,
    avg_spnd_per_bene_2022
FROM medicare_spending
WHERE avg_spnd_per_bene_2022 > (
    SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY avg_spnd_per_bene_2022)
    FROM medicare_spending
)
ORDER BY avg_spnd_per_bene_2022 DESC;

-- 5. Outlier Analysis
SELECT 
    brnd_name,
    tot_spndng_2022,
    outlier_flag_2022,
    avg_spnd_per_bene_2022
FROM medicare_spending
WHERE outlier_flag_2022 = TRUE
ORDER BY tot_spndng_2022 DESC;

-- 6. Generic vs Brand Name Comparison
SELECT 
    CASE WHEN gnrc_name IS NULL THEN 'Brand Only' ELSE 'Has Generic' END as drug_type,
    COUNT(*) as drug_count,
    AVG(tot_spndng_2022) as avg_spending,
    AVG(avg_spnd_per_bene_2022) as avg_cost_per_beneficiary
FROM medicare_spending
GROUP BY CASE WHEN gnrc_name IS NULL THEN 'Brand Only' ELSE 'Has Generic' END;

-- 7. Spending Distribution Analysis
SELECT 
    width_bucket(tot_spndng_2022, 
                min(tot_spndng_2022), 
                max(tot_spndng_2022), 
                10) as bucket,
    count(*) as drug_count,
    min(tot_spndng_2022) as min_spending,
    max(tot_spndng_2022) as max_spending
FROM medicare_spending
GROUP BY bucket
ORDER BY bucket;

-- 8. Top Growing Drugs (2021 to 2022)
SELECT 
    brnd_name,
    tot_spndng_2021,
    tot_spndng_2022,
    ((tot_spndng_2022 - tot_spndng_2021) / tot_spndng_2021 * 100) as growth_percent
FROM medicare_spending
WHERE tot_spndng_2021 > 0 
    AND tot_spndng_2022 > 0
ORDER BY growth_percent DESC
LIMIT 10;