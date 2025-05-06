import pandas as pd
import numpy as np

# Load data
df = pd.read_csv(r"C:\Users\fardi\Downloads\WA_Fn-UseC_-Telco-Customer-Churn.csv")

# Convert TotalCharges to numeric (handle empty strings)
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')

# Drop missing values
df.dropna(inplace=True)

# Save cleaned data for R
df.to_csv(r"C:\Users\fardi\Downloads\telco_churn_cleaned_for_python.csv", index=False)