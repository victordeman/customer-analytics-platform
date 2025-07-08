# Customer Issue Resolution

## Issue: Slow Query Performance
- **Customer Complaint:** Analytics queries for top customers by spend take >10s.
- **Root Cause Analysis:**
  - Used  to identify full table scans on .
  - Found missing index on  and .
  - High read load on primary instance.
- **Solution:**
  - Added composite index: .
  - Configured read replica and routed analytics queries with .
  - Adjusted  to 70% of instance memory.
- **Result:** Query time reduced to 0.8s, improving customer experience.
