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

variable "aws_ami" {
  description = "AWS AMI for EC2 Instances with application"
  default = "amzn-ami-hvm-*-x86_64-ebs"
}

variable "aws_ec2_type" {
  description = "Default type of EC2 Instances for application"
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
