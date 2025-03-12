provider "aws" {
  region = var.aws_region
}


resource "aws_rds_cluster" "development" {
  cluster_identifier = "fast-clone-db-cluster"
  engine             = "aurora-mysql"
  restore_to_point_in_time {
    restore_type               = "copy-on-write"
    source_cluster_identifier  = "frogdb"
    use_latest_restorable_time = true
  }
  skip_final_snapshot = true
  apply_immediately = true
  deletion_protection = false
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "instance-${count.index}"
  cluster_identifier = aws_rds_cluster.development.id
  engine             = "aurora-mysql"
  instance_class     = "db.t3.medium"
  apply_immediately = true
}

output "development_db_endpoint" {
  value = aws_rds_cluster.development.endpoint
}

