# MongoDB Sharding Steps

## Task
Shard collection `sanfrancisco.company_name` based on `_id` field across replicaset_1 and replicaset_2.

## Steps

```javascript
// 1. Enable sharding on database
use admin
sh.enableSharding("sanfrancisco")

// 2. Add new shard
sh.addShard("replicaset_2/node1:27017,node2:27017,node3:27017")

// 3. Shard collection
sh.shardCollection("sanfrancisco.company_name", { "_id": "hashed" })

// 4. Verify
sh.status()
use sanfrancisco
db.company_name.getShardDistribution()
```

## Verification
```bash
mongo --host mongos-host --port 27017
sh.status()
db.company_name.getShardDistribution()
```
