import pandas as pd
import pymysql
import boto3
from sqlalchemy import create_engine
import yaml

# Load configuration
with open("config/database_config.yaml", "r") as f:
    config = yaml.safe_load(f)

# AWS RDS connection
engine = create_engine(
    f"mysql+pymysql://{config['db_user']}:{config['db_password']}@{config['db_host']}/{config['db_name']}"
)

# Extract data from CSV
df = pd.read_csv("data/transactions.csv")

# Transform data
df["transaction_date"] = pd.to_datetime(df["transaction_date"])
df.fillna({"quantity": 1}, inplace=True)  # Handle missing values
df["total_amount"] = df["quantity"] * df["price"]

# Load data into Aurora
df.to_sql("transactions", engine, if_exists="append", index=False)

# Log to CloudWatch
cloudwatch = boto3.client("logs", region_name="eu-central-1")
cloudwatch.put_log_events(
    logGroupName="customer-analytics",
    logStreamName="etl-pipeline",
    logEvents=[{"timestamp": int(pd.Timestamp.now().timestamp() * 1000), "message": "ETL completed"}]
)

print("ETL pipeline executed successfully.")
