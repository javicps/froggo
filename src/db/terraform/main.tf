provider "aws" {
  region = "eu-west-1"
}

module "defaults" {
  source = "../"

  # this block intentionally left blank
}

module "extra_tags" {
  source = "../"

  extra_tags = {
    Product = "foo"
  }
}
/*
resource "aws_rds_cluster" "development" {
  cluster_identifier      = var.target_db_identifier
  engine                  = "aurora"
  snapshot_identifier     = var.source_db_snapshot
  database_name           = "dev_database"
  skip_final_snapshot     = true
}

output "db_cluster_id" {
  value = aws_rds_cluster.development.id
}*/

