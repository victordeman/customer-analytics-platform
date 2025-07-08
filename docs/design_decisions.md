# Design Decisions

## Database Schema
- **Normalization:** Used 3NF to minimize redundancy and ensure data integrity.
- **Partitioning:** Applied range partitioning on  to improve query performance for time-based analytics.
- **Indexes:** Added  and  to optimize common queries.

## ETL Pipeline
- **Python with pandas:** Chosen for efficient data manipulation and compatibility with AWS SDK.
- **CloudWatch Logging:** Integrated for monitoring pipeline execution and debugging.

## Deployment
- **Docker:** Ensures consistent environments across development and production.
- **GitHub Actions:** Automates CI/CD for rapid deployment to EC2.
