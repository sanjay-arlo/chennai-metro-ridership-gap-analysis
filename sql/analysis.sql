-- Chennai Metro: reproducible ridership-gap SQL
-- MySQL 8+; portfolio data is synthetic/illustrative.

-- 1) Corridor KPI layer: CTE + aggregation
WITH corridor_kpi AS (
    SELECT corridor,
           COUNT(*) AS station_quarters,
           AVG(dpr_projected_daily_ridership) AS avg_projected,
           AVG(actual_daily_ridership) AS avg_actual,
           AVG(actual_vs_projected_pct) AS avg_attainment_pct,
           AVG(last_mile_score) AS avg_last_mile_score,
           AVG(fare_sensitivity_score) AS avg_fare_sensitivity
    FROM sample_station_ridership_chennai
    GROUP BY corridor
)
SELECT corridor, station_quarters,
       ROUND(avg_projected,0) AS avg_projected,
       ROUND(avg_actual,0) AS avg_actual,
       ROUND(avg_attainment_pct,2) AS avg_attainment_pct,
       ROUND(avg_last_mile_score,2) AS avg_last_mile_score,
       ROUND(avg_fare_sensitivity,2) AS avg_fare_sensitivity
FROM corridor_kpi
ORDER BY avg_attainment_pct ASC;

-- 2) Window function: station ranking and corridor share
WITH station_kpi AS (
    SELECT station, corridor,
           AVG(actual_daily_ridership) AS avg_actual
    FROM sample_station_ridership_chennai
    GROUP BY station, corridor
)
SELECT station, corridor,
       ROUND(avg_actual,0) AS avg_actual,
       DENSE_RANK() OVER (PARTITION BY corridor ORDER BY avg_actual DESC) AS corridor_rank,
       ROUND(100.0 * avg_actual / NULLIF(SUM(avg_actual) OVER (PARTITION BY corridor),0),2) AS corridor_share_pct
FROM station_kpi
ORDER BY corridor, corridor_rank;

-- 3) CTE + join: stations below corridor attainment benchmark
WITH corridor_avg AS (
    SELECT corridor, AVG(actual_vs_projected_pct) AS corridor_attainment
    FROM sample_station_ridership_chennai
    GROUP BY corridor
)
SELECT s.station, s.corridor, s.quarter,
       ROUND(s.actual_vs_projected_pct,2) AS station_attainment_pct,
       ROUND(c.corridor_attainment,2) AS corridor_attainment_pct,
       ROUND(c.corridor_attainment - s.actual_vs_projected_pct,2) AS gap_vs_corridor,
       s.last_mile_score, s.fare_sensitivity_score
FROM sample_station_ridership_chennai s
JOIN corridor_avg c ON s.corridor = c.corridor
WHERE s.actual_vs_projected_pct < c.corridor_attainment
ORDER BY gap_vs_corridor DESC;

-- 4) Opportunity queue
SELECT station, corridor, quarter,
       dpr_projected_daily_ridership, actual_daily_ridership,
       actual_vs_projected_pct, last_mile_score, fare_sensitivity_score
FROM sample_station_ridership_chennai
WHERE actual_vs_projected_pct < 80
   OR last_mile_score >= 7
ORDER BY actual_vs_projected_pct ASC, last_mile_score DESC
LIMIT 25;

-- 5) Data-quality control
SELECT COUNT(*) AS invalid_rows
FROM sample_station_ridership_chennai
WHERE station IS NULL OR corridor IS NULL OR quarter IS NULL
   OR dpr_projected_daily_ridership IS NULL OR actual_daily_ridership IS NULL
   OR actual_vs_projected_pct IS NULL;
