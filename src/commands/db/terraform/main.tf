provider "aws" {
  region = var.aws_region
}

locals {
  unique_id = formatdate("YYYYMMDDHHmmss", timestamp())
}

resource "aws_rds_cluster" "development" {
  cluster_identifier = "dev-${var.target_db_identifier}-${local.unique_id}"
  engine             = "aurora-mysql"
  restore_to_point_in_time {
    restore_type               = "copy-on-write"
    source_cluster_identifier  = "frogdb"
    use_latest_restorable_time = true
  }

  master_password     = var.db_password
  skip_final_snapshot = true
  apply_immediately   = true
  deletion_protection = false
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count               = 1
  identifier          = "instance-${var.target_db_identifier}-${local.unique_id}"
  cluster_identifier  = aws_rds_cluster.development.id
  engine              = "aurora-mysql"
  instance_class      = "db.t3.medium"
  apply_immediately   = true
  publicly_accessible = true
}

output "development_db_info" {
  value = format(
    "Database created. Use this information to connect:\nendpoint: %s\nport: %s\nuser: admin\npassword: %s",
    aws_rds_cluster.development.endpoint,
    aws_rds_cluster.development.port,
    aws_rds_cluster.development.master_password
  )
}

