resource "aws_security_group" "mysql" {
  name = "mastering-terraform-mysql"
  description = "Mastering Terraform Security Group for AWS RDS MySQL"

  vpc_id = var.aws_vpc_id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [
      var.aws_sg_app_id
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "random_password" "mysql" {
  length           = 40
  special          = true
  min_special      = 5
  override_special = "!#$%^&*()-_=+[]{}<>:?"
}

resource "aws_db_subnet_group" "mysql" {
  name       = "mysql"
  subnet_ids = var.aws_vpc_db_subnets

  tags = merge(
    tomap({"Name" = "Mastering Terraform Database"}),
    var.mandatory_tags
  )
}

resource "aws_rds_cluster" "mysql" {
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.07.1"
  engine_mode            = "serverless"
  database_name          = var.aws_db_name
  master_username        = "admin"
  master_password        = random_password.mysql.result
  enable_http_endpoint   = true
  skip_final_snapshot    = true
  # attach the security group
  vpc_security_group_ids = [aws_security_group.mysql.id]
  # deploy to the subnets
  db_subnet_group_name   = aws_db_subnet_group.mysql.id

  tags = merge(
    tomap({"Name" = "Mastering Terraform Database"}),
    var.mandatory_tags
  )
  tags_all = merge(
    tomap({"Name" = "Mastering Terraform Database"}),
    var.mandatory_tags
  )
}

resource "aws_secretsmanager_secret" "mysql" {
  name = "mysql-${var.aws_db_name}"
}

resource "aws_secretsmanager_secret_version" "mysql" {
  secret_id = aws_secretsmanager_secret.mysql.id

  # encode in the required format
  secret_string = jsonencode(
    {
      username = aws_rds_cluster.mysql.master_username
      password = aws_rds_cluster.mysql.master_password
      engine   = "mysql"
      host     = aws_rds_cluster.mysql.endpoint
    }
  )
}

