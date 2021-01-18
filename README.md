# Udacity Cloud DevOps Engineer
### Lesson 3 Deploy Infrastructure as Code
### Project 2: Deploy a high-availability web app using CloudFormation

## Included Code:
- aws-cf-stack.sh
  A bash script to create/update/delete/describe/list cloudformation stacks
**NOTE** awscli MUST be install before using scripts


Example:
  ```
  ## Create
  ./aws-cf-stack.sh create MyCFStack network.yaml network_param.json
  ## Delete
  ./aws-cf-stack.sh delete MyCFStack
  ```
**NOTE:** When creating the IAM roles, must include the --capabilities CAPABILITY_NAMED_IAM flags when running the script.

## CloudFormation inputs:
- network.yml : Code to build the appropriate network resources
- network_params.json: Parameters for networking
- roles.yml:  The necessary IAM roles for the S3 bucket containing the code
- role_params.json: Parameters for the Roles
- servers.yml: Resources for deployment of the code
- server_params.json: Parameters for the servers

## Stack Creation Order:
- network
- roles
- servers

### URL
http://udaci-webap-14yeenztb4048-344504401.us-west-2.elb.amazonaws.com/
