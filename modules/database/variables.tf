variable "aws_vpc_id" {
  description = "AWS VPC ID which was created for the project"
}

variable "aws_vpc_db_subnets" {
  description = "List of AWS VPC Database Subnets to deploy Application Load Balancer"
  type = list(string)
}

variable "aws_sg_app_id" {
  description = "ID of Application Security Group"
}

variable "aws_db_type" {
  description = "Default type of AWS RDS Postgresql"
}

variable "aws_db_name" {
  description = "Default name of AWS RDS Postgresql"
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
