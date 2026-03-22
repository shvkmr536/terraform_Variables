variable "aws_region" {
  type        = string
  description = "AWS region"

  validation {
    condition     = can(regex("^ap|us|eu", var.aws_region))
    error_message = "Region must be valid AWS region format."
  }
}

variable "environment" {
  type        = string
  description = "Environment name"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod."
  }
}

variable "instance_count" {
  type        = number
  default     = 1
}

variable "enable_ec2" {
  type        = bool
  default     = true
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) > 0
    error_message = "At least one availability zone must be provided."
  }
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)

  default = {}
}