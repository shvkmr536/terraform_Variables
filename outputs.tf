output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}

output "ec2_public_ips" {
  value = aws_instance.web[*].public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}