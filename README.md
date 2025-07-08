# Customer Analytics Platform

This project is a scalable customer analytics platform built with AWS RDS/Aurora MySQL, designed to process and analyze high-volume transaction data. It demonstrates expertise in MySQL database engineering, AWS cloud integration, query optimization, and automated deployment using Docker and GitHub Actions.

## Repository Structure
```
customer-analytics-platform/
├── README.md
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── scripts/
│   ├── etl_pipeline.py
│   ├── setup_database.py
│   └── optimize_queries.sql
├── sql/
│   ├── schema.sql
│   ├── sample_data.sql
│   └── analytics_queries.sql
├── config/
│   ├── aws_credentials.ini
│   └── database_config.yaml
├── docs/
│   ├── design_decisions.md
│   ├── performance_tuning.md
│   ├── mentoring_guide.md
│   └── customer_issue_resolution.md
├── .github/
│   └── workflows/
│       └── ci_cd.yml
├── requirements.txt
└── tests/
    └── test_etl.py
```

## Setup Instructions
1. Clone the repository: `git clone https://github.com/victordeman/customer-analytics-platform`
2. Configure AWS RDS Aurora MySQL and update `config/database_config.yaml` with credentials.
3. Install dependencies: `pip install -r requirements.txt`
4. Run database setup: `mysql -h <rds-endpoint> -u <db-user> -p < sql/schema.sql`
5. Execute ETL pipeline: `python scripts/etl_pipeline.py`
6. Deploy with Docker: `docker build -t customer-analytics .`

## Features
- Optimized MySQL/Aurora schema for transaction analytics.
- Python-based ETL pipeline for data processing.
- Automated CI/CD with GitHub Actions.
- Performance tuning with indexes and read replicas.
- Detailed documentation and mentoring guide.

See `docs/` for design decisions, performance tuning, and customer issue resolution details.
