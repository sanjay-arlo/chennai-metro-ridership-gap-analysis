-- Chennai Metro: ridership-gap analysis
SELECT corridor,
       COUNT(*) AS station_quarters,
       ROUND(AVG(dpr_projected_daily_ridership),0) AS avg_projected,
       ROUND(AVG(actual_daily_ridership),0) AS avg_actual,
       ROUND(AVG(actual_vs_projected_pct),2) AS avg_actual_vs_projected_pct,
       ROUND(AVG(last_mile_score),2) AS avg_last_mile_score
FROM sample_station_ridership_chennai
GROUP BY corridor
ORDER BY avg_actual_vs_projected_pct ASC;

SELECT station, corridor, quarter,
       dpr_projected_daily_ridership, actual_daily_ridership,
       actual_vs_projected_pct, last_mile_score, fare_sensitivity_score
FROM sample_station_ridership_chennai
ORDER BY actual_vs_projected_pct ASC
LIMIT 20;
