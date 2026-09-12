# Chennai Metro Ridership Gap Analysis

> **Business Analyst / Data Analyst portfolio case study** analysing station-level ridership against planning projections to identify demand gaps, last-mile opportunities and growth priorities.

## 🚀 Live Dashboard

**[Open the interactive dashboard](https://sanjay-arlo.github.io/chennai-metro-ridership-gap-analysis/)**

## Executive summary

The case converts station-level demand data into a business decision workflow: validate projected versus actual ridership, segment stations and corridors, investigate potential gap drivers, visualise opportunity areas, and recommend targeted ridership-growth interventions.

## Business problem

**Which stations and corridors run furthest below projected ridership, and what actions could close the gap?**

## Analyst workflow

**Excel → Python / Pandas / NumPy (optional) → SQL / MySQL → Power BI → Decision**

### 1. Excel — first-pass control

Clean station-quarter records, reconcile projected versus actual ridership, calculate attainment and gap measures, build pivots and create an initial underperformance/exception view.

### 2. Python — optional analytical layer

Use **Pandas + NumPy** for EDA, station-level transformations, outlier detection, gap distributions and sensitivity analysis when programmatic analysis adds value.

### 3. SQL / MySQL — mandatory analytical layer

Use joins, CTEs, aggregations, window functions, corridor/station segmentation, ranking and exception queues to produce reproducible demand and opportunity metrics.

### 4. Power BI — mandatory executive layer

Build the analytical model and DAX measures, then structure the story as **Ridership Executive → Corridor Performance → Station Opportunity → Growth Scenario** with drill-through and slicers.

### 5. Decision — mandatory outcome

Recommend feeder, catchment, service or commercial interventions using **priority, owner, action, expected ridership impact and assumptions**.

## Technical stack

- **Excel** — data cleaning, reconciliation, formulas, pivots, exception analysis and scenario planning
- **SQL / MySQL** — demand KPIs, segmentation, ranking and opportunity queues
- **Python / Pandas / NumPy** — optional EDA, transformations, outlier checks and sensitivity analysis
- **HTML / CSS / JavaScript** — interactive live dashboard
- **Chart.js** — browser-based visualisation
- **GitHub Pages** — live dashboard hosting
- **Power BI** — compatible dashboard design direction, data model, DAX and executive reporting specification
- **GitHub** — version control and documentation

## Dashboard story

1. **Ridership Executive** — projected versus actual demand
2. **Corridor Performance** — corridor-level attainment and comparison
3. **Station Opportunity** — largest gaps and last-mile opportunities
4. **Driver View** — last-mile and fare-sensitivity signals
5. **Growth Scenario** — illustrative intervention assumptions
6. **Decision Queue** — prioritised station actions

## KPI framework

- **Ridership gap %** = (projected daily ridership − actual daily ridership) / projected daily ridership × 100
- **Attainment %** = actual daily ridership / projected daily ridership × 100
- **Last-mile opportunity** = lower connectivity combined with demand underperformance
- **Station priority** = demand gap + improvement opportunity + commercial/service feasibility

## Business Analyst deliverables

Business framing, requirements thinking, KPI dictionary, Excel analysis, optional Python EDA, SQL/MySQL analysis, Power BI/DAX specification, interactive dashboard, opportunity ranking and management recommendations.

## Data quality & governance

Validate required fields, numeric ranges, projected/actual relationships, duplicates and dashboard-to-source reconciliation. Maintain clear distinction between illustrative portfolio data and verified transport records.

## Production upgrade path

A production model should use verified smart-card/tap data, official planning baselines, feeder-transit data, station catchments, service/fare variables and governed station master data. Add refresh SLAs, anomaly monitoring, source lineage and approved intervention thresholds.

## Important limitation

This is a **portfolio case study using synthetic / illustrative data**. It is not an official Chennai Metro Rail planning report or a source of operational ridership figures.

## Author

**Sanjay Arlo**  
Business Analyst / Data Analyst Portfolio  
[GitHub](https://github.com/sanjay-arlo)
