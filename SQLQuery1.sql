-- combining both tables
WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT dteday,  a.yr, season, 
       weekday, hr, rider_type, 
      riders, price,  COGS,
	  -- Calculating revenue 
      round(riders*price,2) as revenue,
	  -- Calculating profit 
      round(riders*price- COGS,2) as profit
/* Referencing the CTE as 'a' 
Joining the cost_table to get additional cost-related data */
FROM cte a
left join cost_table b
on a.yr = b.yr 