variable "aws_region" {
  description = "AWS region where the database will be deployed"
  type        = string
  default     = "eu-west-1"
}

variable "aws_profile" {
  description = "AWS profile to use for authentication"
  type        = string
}

variable "source_db_snapshot" {
  description = "Source Aurora DB snapshot ID"
  type        = string
}

variable "target_db_identifier" {
  description = "Identifier for the new development Aurora DB"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for the Aurora database"
  type        = string
  default     = "db.r6g.large"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
