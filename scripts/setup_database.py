import pymysql
import yaml

# Load configuration
with open("config/database_config.yaml", "r") as f:
    config = yaml.safe_load(f)

# Connect to RDS/Aurora
connection = pymysql.connect(
    host=config['db_host'],
    user=config['db_user'],
    password=config['db_password'],
    database=config['db_name']
)

try:
    with connection.cursor() as cursor:
        with open("sql/schema.sql", "r") as schema_file:
            schema_sql = schema_file.read()
            cursor.execute(schema_sql)
        with open("sql/sample_data.sql", "r") as data_file:
            data_sql = data_file.read()
            cursor.execute(data_sql)
    connection.commit()
    print("Database setup completed.")
finally:
    connection.close()
