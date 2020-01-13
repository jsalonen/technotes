# AWS RDS and Databases

RDS databases are AWS managed; Amazon is responsible for operating your RDS instances

AWS RDS relational databases:

- SQL Server
- Oracle
- MySQL Server
- PostgreSQL
- Aurora
- MariaDB

Key features:

- Multi-AZ, automatic failover (disaster recovery)
- Read Replicas, no automatic failover, allows scaling out reads (performance)

Other databases:

- DynamoDB (NoSQL)
- Amazon RedShift (Data Warehousing)
- ElastiCache: Memcached, Redis (In-memory cache in the cloud)

## Backups

Automatic backups:

- Data stored in S3
- RDS instances contain (for no extra charge) same amount of RDS storage as instance size (1 Gb for 1 Gb)
- Deleted when original RDS instance is deleted

Database snapshots:

- Done manually
- Persist even after you delete your RDS instance

Restoring backups:

- Restored backups are restored to a new RDS endpoint (=database hostname changes)

## Multi-AZ

- Exact copy of your database in several availability zones
- Replication is synchronous; writes are automatically syncronized
- AWS manages replication
- Failovers are automatic
- Use Multi-AZ for disaster recovery only, do not use to improve performance
- Reboot with failover

## Read Replicas

- Only one master database with read/write
- Use to improve performance if your access pattern is read-heavy (=connect to read replicas)
- You can have up to 5 read replicas
- Alternative solution to improve performance: ElastiCache
- Each read replica has their own DNS endpoint
- Multi-AZ can have read replicas
- Read replicas can be placed in other regions
- Read replicas can be be made out of Aurora, a route to Aurora migration (MySQL -> Aurora)
- Read replicas can be promoted (and detached) to a new database master
- Read replicas: backups must be turned on to enable read replicas
- Supported databases: MySQL, PostgreSQL, MariaDB, Oracle, Aurora

## DynamoDB

- Fast (and flexible) NoSQL database
- Allows for single-digit millosecond latency at a scale
- Fully managed by AWS: data stored on SSD, across 3 (geographically distinct) data centres
- Supported consistency models:
  - Eventual Consistent Reads (faster, default)
    - May take several seconds before after a write all reads return the updated value
  - Strongly Consistent Reads (slower, optional)
    - All reads after a write return the updated value

## Redshift

- Data warehouse service
- Fully managed by AWS
- Good use cases is Business Intelligence (BI):
  - Online Analytics Processing (OLAP)
    - Primary database in RDS, use Redshift for analytics
- Single-node (128 Gb) / multi-node configurations
- Employs advanced compression
  - Automatically finds suitable compression scheme for your data
  - Does not require indexes

Backups:

- 1 day retention period
- Maximum retention period is 35 days
- Always attempts to maintain 3 copies of your data

Encryption:

- In transit: SSL
- At rest: AES-256
- By default, encryption managed by Redshift

## Aurora

- Up to five times better performance than MySQL, at a 1/10 price point
- Start with 10GB, scale in 10GB increments to 64 TB (autoscaling)
- Compute resources: 32vCPUs, 244GB mem
- Each AZ contains 2 copies of your aurora data, minimum of 3 AZs (=6 copies)
- Compatible with: MySQL, PostgreSQL

Fault tolerance:

- Design:
  - Loss of up to two copies: no effect to write avaibility
  - Loss of up to three copies: no effect to read availability
- Self-healing storage: disks scanned and repaired automatically
- Replicas: Aurora replicas (up to 15), MySQL replicas (up to 5)

Backups:

- Automatic backups always enabled
- Snapshots supported
- Aurora Snapshots can be shared between accounts

## Elasticache

- In-memory cache in the cloud
- AWS managed
- Redis: Multi-AZ, supports backups
