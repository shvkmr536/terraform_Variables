resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(var.tags, {
    Name = "${var.environment}-vpc"
  })
}

resource "aws_subnet" "subnets" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zones[count.index]

  cidr_block = cidrsubnet(
    aws_vpc.main.cidr_block,
    8,
    count.index
  )

  tags = {
    Name = "${var.environment}-subnet-${count.index}"
  }
}

#Conditional EC2 Creation

resource "aws_instance" "web" {
  count = var.enable_ec2 ? var.instance_count : 0

  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnets[0].id

  tags = merge(var.tags, {
    Name = "${var.environment}-ec2-${count.index}"
  })
}

#S3 Bucket with merge() Tags
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-terraform-demo-bucket-${random_id.rand.hex}"

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "random_id" "rand" {
  byte_length = 4
}