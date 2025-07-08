# Performance Tuning Notes

## MySQL/Aurora Configuration
- Set  to 70% of instance memory for optimal caching.
- Enabled  for frequently executed analytics queries.
- Configured read replicas to offload analytics workloads.

## Linux Tuning
- Adjusted  to 10 on EC2 instances to prioritize memory over swap.
- Increased unlimited for open files to support high concurrent connections.

## Customer Issue: Slow Query Performance
- **Root Cause:** Missing index on  caused full table scans.
- **Solution:** Added composite index and routed analytics queries to read replica.
- **Result:** Query execution time reduced from 12s to 0.8s.

## Mentoring Guide for Junior Engineers
- **Understanding EXPLAIN:** Use  to identify table scans and optimize with indexes.
- **Lock Contention:** Monitor  for deadlocks and adjust transaction isolation levels.
- **Aurora Features:** Leverage Aurora’s auto-scaling and performance insights for monitoring.
