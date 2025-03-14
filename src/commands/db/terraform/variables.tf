variable "aws_region" {
  description = "AWS region where the database will be deployed"
  type        = string
  default     = "eu-west-1"
}

variable "target_db_identifier" {
  description = "Identifier for the new development Aurora DB"
  type        = string
  default     = "cluster"
}

variable "origin_db_identifier" {
  description = "Identifier for the source development Aurora DB"
  type        = string
  default     = "frogdb"
}

variable "db_name" {
  default = "prod"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "password"
}
