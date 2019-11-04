# AWS - Key Concepts

### AWS Global Infrastructure

- Region = Geographical area
- Availability Zone (AZ) = Data Center within a Region
- Regions contain 2 or more Availability Zones
- Edge Location = Content-delivery network (CDN) endpoint (for Cloud Front CDN)

### Networking & Content Delivery

- VPC = Virtual Private Cloud ("Virtual data center")
- Route 53: Amazon's DNS Servers ("Named after DNS port 53")
- Cloud Front = Content Delivery Network Service
- Direct Connect = Connect Physical Data Centers directly to AWS, dedicated line outside internet

### Compute

- EC2 = Elastic Computing Cloud ("virtual machines in cloud")
- ECS or EC2 Container Service: Docker containers on top of EC2
- Elastic Beanstalk: simple deployments for someone who doesn't know AWS in-depth
- Lambda: Function as a Service
- Lightsail: Out-of-box cloud ("Wordpress", "Joomla")
