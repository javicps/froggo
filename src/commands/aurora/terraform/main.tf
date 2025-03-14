provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name = "mydb-subnet-group"
  subnet_ids = [
    "subnet-095a613a91ab6be23",
    "subnet-0ae85abef98fa5670",
    "subnet-03aedf2d907dbeab8"
  ]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}

resource "aws_security_group" "allow_aurora" {
  name        = "Aurora_sg"
  description = "Security group for RDS Aurora"

  ingress {
    description = "MYSQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_rds_cluster" "frogdb" {
  cluster_identifier     = "frogdb"
  engine                 = "aurora-mysql"
  engine_version         = "8.0.mysql_aurora.3.05.2"
  master_username        = var.db_user
  master_password        = var.db_password
  database_name          = var.db_name
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids = [aws_security_group.allow_aurora.id]

  tags = {
    Name = "AuroraCluster"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier  = aws_rds_cluster.frogdb.id
  instance_class      = "db.t3.medium"
  engine              = aws_rds_cluster.frogdb.engine
  publicly_accessible = true

}
