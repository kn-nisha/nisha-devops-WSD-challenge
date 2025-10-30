# Cassandra - Query Returns Different Results Including Deleted Data

## Root Cause
Low consistency level (ONE) causes queries to hit different replicas with different data states. Deleted data appears because tombstones haven't propagated to all nodes.

## Solution

1. **Use QUORUM Consistency:**
```cql
CONSISTENCY QUORUM;
SELECT * FROM table WHERE id = ?;
```

2. **Run Regular Repairs:**
```bash
nodetool repair keyspace_name
```

3. **Enable Read Repair:**
```cql
ALTER TABLE keyspace.table WITH read_repair_chance = 0.1;
```

## Prevention
- Always use QUORUM for critical queries
- Schedule weekly repairs
- Monitor node health
