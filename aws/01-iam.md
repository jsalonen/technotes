# AWS IAM

IAM = Identity and access management. Manage users and their leve of access to the AWS console.

Key terms:

- **Users**
- **Groups** - Collections of users
- **Policies** - Give specific permissions for user/group/role
- **Roles** - Are assigned to specific AWS resources for access to other resources

## Users

Access types:

- Programmatic access (access with access key ID and secret accesss key)
- Management console access (sign-in to management console with a password)

## Groups

Policies can be attached to groups

- Managed policies: read-made policies by AWS
- Custom policies: 

## Roles

Allow trusted entities to use specific resources

- Trusted entities: any AWS service (EC2, Lambda), another AWS account, identity (Cognito, OpenID) or SAML 2.0 federation
- Permissions: the resources the trusted entity can use

## Password policy

- Set of rules for IAM user passwords
- Can be used to require set of characters, password rotation, etc.
