from pathlib import Path
import csv
p=Path(__file__).parents[1]/'sample_station_ridership_chennai.csv'
req={'quarter','station','corridor','dpr_projected_daily_ridership','actual_daily_ridership','actual_vs_projected_pct','last_mile_score','fare_sensitivity_score','common_mobility_card_share'}
with p.open(newline='',encoding='utf-8') as f: rows=list(csv.DictReader(f))
missing=sorted(req-set(rows[0])) if rows else sorted(req)
invalid=sum(1 for r in rows if float(r['dpr_projected_daily_ridership'])<=0 or float(r['actual_daily_ridership'])<0 or not 0<=float(r['last_mile_score'])<=100 or not 0<=float(r['common_mobility_card_share'])<=100)
print({'rows':len(rows),'missing_columns':missing,'invalid_rows':invalid})
