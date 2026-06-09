# Write your MySQL query statement below

# the sum or all total investment values in 2016 tiv_2016 for all policyholders:
# have the same tiv_2015 values as one or more other policyholders
# not located in the same city as any other policyholder

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
AND tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
);