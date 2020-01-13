# Route 53

DNS port is 53 -> Route 53 named after it

## DNS

- SOA = Start Of Authority Record:
  - Name of the server that supplied the data
  - Administrator of the zone
  - Current version of the data file
  - Default TTL (time-to-live) file on resource records

NS = Name Server. Top Level Domain servers to direct traffic to the Content DNS server which contains authoritative DNS records

DNS Record types:

- A Record = name to IP address resolution ("Address Record")
  - Example: A 
- CName = resolve domain name to another ("Canonical Name")
- Alias Record = Map resource record sets to AWS resources (load balancer, S3 bucket, etc.)
- CNames cannot be used for naked domain records (root.com), you have to use alias or A Record

Always prefer Alias record over CName.

## Common DNS Types

- SOA Records
- NS Records
- A Records
- CNAMES
- MX Records
- PTR Records

## AWS and DNS

- You can buy domain names from AWS
- Takes up to 3 days to register

## Routing Policies

Flow:

- User -> DNS request -> Route53 --> (routing policy) --> target

Policy types:

- Simple Routing Policy: multiple IPs per record, all IP values returned to user in random order
  - List of IPs can be specified in single record
- Weighted Routing Policy: allows to route to target with different weights (e.g. 10% to first target, 90% to second)
  - You need to add multiple record sets with IDs (e.g. London, Helsinki) and weights (e.g. 30, 70)
- Latency-Based Routing Policy: routes traffic based on lowest network latency for end user
  - You need to add multiple record sets with IDs and regions for latency check
- Failover Routing Policy
  - Setup active/passive site with primary/secondary records (e.g. primary site in EU, secondary site in US)  
- Geolocation Routing Policy
  - Choose where traffic will be sent based on geographic location of your users (DNS query origin location)
  - Add new record for each location + ID pair
- Geoproximity Routing Policy
  - Route traffic to resources based on geolocatin of user and your resources
  - You must use Route53 Traffic flow to use it
- Multivalue Answer Policy
  - Lets you configure Route53 to return multiple values like IP addresses to DNS queries
  - Combine with healthcheck -> each value is checked for health and returned only if healthy
  - Like simple routing policy, but with per-record health checks

Health checks:

  - Health checks can be associated with individual record sets
  - If health check fails a record set is removed from DNS
  - Alerts can be triggered from health checks
