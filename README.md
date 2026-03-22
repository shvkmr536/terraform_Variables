# Terraform Fundamentals Assignment

## Features
- Modular file structure
- Variable validation
- Conditional resource creation
- Dynamic subnet calculation
- Environment-based deployment

## Usage
terraform init 

terraform apply -var-file="dev.tfvars"

## Variables
- aws_region: AWS region
- environment: dev/prod
- instance_count: number of EC2 instances
- enable_ec2: toggle EC2 creation

## Outputs
- VPC ID
- Subnet IDs
- EC2 Public IPs
- S3 Bucket Name