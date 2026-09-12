# Industry BA Delivery Pack — Chennai Metro Demand & Last-Mile Growth

## Executive decision
Identify stations and corridors where demand is materially below planning expectations and prioritise last-mile interventions with the strongest growth potential.

## Stakeholders
Transit planning, station operations, feeder-bus teams, commercial planning, finance and customer-experience teams.

## Requirements
- Compare actual and projected station demand.
- Rank stations by gap and last-mile opportunity.
- Analyse fare sensitivity and mobility-card adoption.
- Support corridor-level intervention scenarios.
- Export the selected analytical slice.

## KPI dictionary
Projected ridership, actual ridership, attainment %, ridership gap %, last-mile score, fare sensitivity and mobility-card share.

## Analytical model
`dim_station` + `dim_corridor` + `dim_quarter` → `fact_station_demand` → growth/opportunity KPI layer.

## Scenario model
Test ridership uplift, last-mile uplift and fare-sensitivity assumptions to compare station opportunity rankings.

## Acceptance criteria
Projection and actual values reconcile, gap % is reproducible, filters cascade to charts and tables, ranking is deterministic, and scenario assumptions are clearly labelled.

## Production controls
Verified smart-card data, official planning baselines, station master data, feeder-service lineage, anomaly detection and governed refresh schedules.

## Portfolio note
Synthetic illustrative data only; not an official transport-planning report.
