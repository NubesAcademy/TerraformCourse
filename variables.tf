variable "aws_region" {
  description = "Default region to deploy infrastructure"
}

variable "aws_vpc_cidr" {
  description = "AWS VPC CIDR block"
  type = string
  default = "10.1.0.0/16"
}

variable "aws_vpc_azs" {
  type = number
  description = "Count of AWS Availability Zones to deploy infrastructure"
}

variable "aws_vpc_db_subnets" {
  type = list(string)
  description = "AWS VPC list of subnets to deploy database resources"
}

variable "aws_bastion_ami" {
  description = "ID of AWS AMI for Bastion EC2 Instance"
}

variable "aws_bastion_ec2_type" {
  description = "Default type of EC2 Instances for bastion host"
}

variable "aws_app_ami" {
  description = "Name of AWS AMI for EC2 Instances with application"
  default = "amzn-ami-hvm-*-x86_64-ebs"
}

variable "aws_app_ec2_type" {
  description = "Default type of EC2 Instances for application"
}

variable "aws_db_type" {
  description = "Default type of AWS RDS Postgresql"
}

variable "aws_db_name" {
  description = "Default name of AWS RDS Postgresql"
}

variable "domain_name" {
  description = "Domain name which will be used for AWS resources, e.g. youdomain.com"
}

variable "s3_bucket_name" {
  description = "Name of AWS S3 Bucket"
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
