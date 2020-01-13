# AWS VPC

VPC = Virtual Private Cloud

- Think as VPC as virtual data centre in the cloud
- Logically isolated section inside AWS
- You have complete control over your networking environment (IPs, routing tables, etc.)
- You can easily customize the network configuration for your Amazon Virtual Private Cloud. E.g.
  - Public-facing subnet
  - Private-facing subnet
- Multiple layers of security (security groups, Access Control Lists; ACLs)
- VPN connections between on-site datacenter and your VPC

VPC in layers:

- REGION (eu-west-1)
  - VPC (myvpc - 10.0.0.0/16)
    - Internet Gateway / Virtual Private Gateway
      - Router
        - Route Table
          - Network ACL
            - Public subnet
              - Security Group
                - Instance
        - Route Table
          - Network ACL
            - Private subnet
              - Security Group
                - Instance

Bastion host: EC2 instance in public subnet that can be used to connect to EC2 instance inside private subnet. Flow:
  - Public internet -> bastion host -> instance inside private subnet

Private network address spaces:
- 10.0.0.0 - 10.255.255.255.255 (10/8 prefix)
  - Largest AWS allows is 10.0.0.0/16
- 172.16.0.0 - 172.31.255.255 (172.16/12 prefix)
- 192.168.0.0 - 192.168.255.255 (192.168/16 prefix)

Website recommendation:

CIDR.xyz (interactive IP address and CIDR range visualizer)

## VPC Features

- Subnets
  - Launch instances inside
  - Assign IP ranges
- Route tables
  - Configure between subnets
- Internet gateways
  - Create and attach
- Security groups
- Subnet ACLs
- VPC Peering
  - Connect VPCs together using private IPs
  - Peering possible between multiple AWS accounts
  - Not transitive; you cannot peer through VPCs, so each VPC must be explicitly peered together to communicate

### Default VPC

- Default VPC has easy, user-friendly defaults for easy provisioning
- All subnets have internet gateway
- Each instances have private and public addresses

## Building a VPC from ground up

