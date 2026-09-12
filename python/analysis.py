"""Optional Pandas/NumPy station opportunity analysis.
Run: python analysis.py --input path/to/data.csv
"""
import argparse
import numpy as np
import pandas as pd

REQUIRED = ["quarter", "station", "corridor", "dpr_projected_daily_ridership", "actual_daily_ridership", "last_mile_score", "fare_sensitivity_score"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    args = parser.parse_args()
    df = pd.read_csv(args.input)
    missing = [c for c in REQUIRED if c not in df.columns]
    if missing:
        raise ValueError(f"Missing required columns: {missing}")

    for col in REQUIRED[3:]:
        df[col] = pd.to_numeric(df[col], errors="coerce")
    df["attainment_gap"] = df["dpr_projected_daily_ridership"] - df["actual_daily_ridership"]
    df["opportunity_score"] = (
        np.maximum(df["attainment_gap"], 0) * (df["last_mile_score"] + 1)
        / np.maximum(df["fare_sensitivity_score"] + 1, 1)
    )
    station = (
        df.groupby(["station", "corridor"], as_index=False)
        .agg(avg_gap=("attainment_gap", "mean"),
             avg_last_mile=("last_mile_score", "mean"),
             avg_fare_sensitivity=("fare_sensitivity_score", "mean"),
             opportunity=("opportunity_score", "mean"))
        .sort_values("opportunity", ascending=False)
    )
    station["opportunity_percentile"] = station["opportunity"].rank(pct=True) * 100
    print("Rows:", len(df))
    print(station.head(20).to_string(index=False))


if __name__ == "__main__":
    main()
