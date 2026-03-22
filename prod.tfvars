aws_region        = "us-east-1"
environment       = "prod"
instance_count    = 2
enable_ec2        = true

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

tags = {
  Owner = "DevOpsTeam"
}