provider "aws" {
  region = var.aws_region
}

resource "aws_rds_cluster" "source_db" {
  cluster_identifier  = "source-db-cluster"
  engine              = "aurora-mysql"
  master_username     = "root"
  master_password     = "password"
  database_name       = "source_db"
  skip_final_snapshot = true
}

resource "aws_rds_cluster" "development" {
  cluster_identifier  = "fast-clone-db-cluster"
  engine              = "aurora-mysql"
  snapshot_identifier = aws_rds_cluster.source_db.id
  database_name       = aws_rds_cluster.source_db.snapshot_identifier
  skip_final_snapshot = true
}

output "fast_clone_endpoint" {
  value = aws_rds_cluster.fast_clone.endpoint
}

