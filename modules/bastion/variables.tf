variable "aws_ami" {
  description = "ID of AWS AMI for Bastion EC2 Instance"
}

variable "aws_ec2_type" {
  description = "Default type of EC2 Instances for bastion host"
}

variable "aws_vpc_id" {
  description = "AWS VPC ID which was created for the project"
}

variable "aws_vpc_public_subnets" {
  description = "List of AWS VPC Public Subnets to deploy Application Load Balancer"
  type = list(string)
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}

variable "domain_zone_id" {
  description = "Route53 Zone ID"
}
