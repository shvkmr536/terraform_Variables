aws_region        = "us-east-1"
environment       = "dev"
instance_count    = 1
enable_ec2        = true

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

tags = {
  Owner = "DevOpsTeam"
}