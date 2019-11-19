# AWS - Overview

## Key Services and Concepts

### AWS Global Infrastructure

- Region = Geographical area
- Availability Zone (AZ) = Data Center within a Region
- Regions contain 2 or more Availability Zones
- Edge Location = Content-delivery network (CDN) endpoint (for Cloud Front CDN)

### Networking & Content Delivery

- VPC = Virtual Private Cloud ("Virtual data center")
- Route 53: Amazon's DNS Servers ("Named after DNS port 53")
- Cloud Front = Content Delivery Network Service

### Compute

- EC2 = Elastic Computing Cloud ("virtual machines in cloud")
- ECS or EC2 Container Service: Docker containers on top of EC2
- Lambda: Function as a Service

### Storage

- S3 = Simple Storage Service, cloud-based object storage (think: files in cloud)
- Glacier = Long-term, low cost S3 object storage (think: backups, persisting data)
- EFS = Elastic File System, NFS file system (think: file system you can share)
- Storage Gateway = On-premises access to cloud storage
- EBS = Elastic Block Store (think: hard-drive you attach to machines)

### Databases

- RDS = Relation Database Service, managed database in cloud (think: hosted SQL servers)
- DynamoDB = NoSQL Database, managed in cloud (think: hosted key-value and document database servers)
- Redshift = Cloud data warehouse (think: big data in cloud)
- Elasticache = Managed caching layer in cloud (think: hosted Memcached/redis)

### Security & Identity

- IAM = Identity and Access Management (think: user management)
- Inspector = Automated security assessments
- Amazon Certificate Management (ACM) = SSL-certificates in cloud
- Directory Service = Active Directory (AD) in Amazon
- WAF = Web Application Firewall, application-level protection (think: SQL injection et al. protection)
- Artifacts = (think: boring ISO 9001 compliance documentations for you to get if you need them)

### Management Tools

- Cloud Watch = Monitor and log your infrastructure 
- Cloud Formation = Tool for creating your infrastructure programmatically (think: turn infrastructure into code)

### Messaging

- SNS = Simple Notification Service, managed pub/sub messaging (think: trigger and catch events in the cloud)
- SQS = Simple Queue Service for decoupling application dependencies (think: queue in cloud)
- SES = Simple Email Services (think: send and receive emails in cloud)

## Additional Services and Concepts

### Networking & Content Delivery

- Direct Connect = Connect Physical Data Centers directly to AWS, dedicated line outside internet

### Compute

- Elastic Beanstalk: simple deployments for someone who doesn't know AWS in-depth
- Lightsail: Out-of-box cloud (think: simple Wordpress deploy)

### Migration

- Snowball = Transport your data to cloud with a physical device (think: hard drive you fill and send back)
- Snowball Edge = Snowball device with EC2/Lambda edge computing capability (think: run apps in edge location)
- DMS = Data Migration Service, migrate to RDS or between RDS databases without downtime (think: change your database on the fly)
- Service Migration Service = Replicate your existing Virtual Machines to AWS cloud (think: move from existing machines to Amazon)

### Analytics

- Athena = Run SQL queries on S3 (think: SQL queries over files in cloud)
- EMR = Elastic Map Reduce, process data with Spark, Hadoop, etc.
- Cloud Search = Fully-managed search engine based on Apache Solr (think: legacy search engine)
- Elastic Search = fully-managed elastic search (think: newer search engine)
- Kinesis = Collect, process and analyze video data data streams in real time (think: modern ETL in cloud)
- Data Pipeline = Move data from one place to another (think: file batch transfer in cloud like FTP)
- Quick Sight = Cloud-based Business Intelligence solution

### Management Tools

- Cloud Trail = Continuously monitor and log your account activity (think: audit trail in cloud)
- Opsworks = Automate deployment using Chef (think: hosted Chef)
- Config = Way of monitoring your environment with alerts
- Service Catalog = Manage your approved IT services for use on AWS
- Trusted Advisor = Tool for scanning your infrastructure against best practises

### Developer Tools

- CodeCommit = Github in cloud
- CodeBuild = CI in cloud (pay per minute)
- CodeDeploy = CD in cloud
- CodePipeline = Define you CD pipeline in cloud

### Application Services

- Step Functions = Glue together multiple AWS service into serverless workflows
- SWF = Simple Workflow Service, run background jobs (think: cron in cloud)
- API Gateway = Way for managing and publishing APIs
- AppStream = Way of streaming desktop applications to users
- Elastic Transcoder = Run transcoders in cloud

### Internet of Things

- IoT = A way of connecting, communicating with and keeping track of millions of devices

### Artificial Intelligence

- Alexa ("lex")
- Polly - Turn text to voice
- Machine Learning
- Rekognition - Detect features in images

### Mobile Services

- Mobile Hub = Features for mobile apps
  - User auth
  - Data storage
  - Backend logic
  - Push notification
  - Content delivery
  - Analytics
- Cognito = User Sign-Up, Sign-In and Access Control
- Device Farm = Test your apps on physical devices
- Mobile Analytics = App usage data tool
- Pinpoint = Mobile app analytics (think: google analytics for mobile apps)

### Desktop and App Streaming

- WorkSpaces = A way of having your desktop in the cloud (think: Windows PC in cloud)
- AppStream 2.0 = Stream desktop applications to any computer

### Business Productivity

- WorkDocs = Store your work documents in cloud
- WorkMail = Send and receive email
