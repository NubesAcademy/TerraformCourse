data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "Mastering Terraform"
  azs = slice(data.aws_availability_zones.available.names, 0, var.aws_vpc_azs - 1)

  cidr = var.aws_vpc_cidr
  public_subnets = [
    for index in range(100, 100 + var.aws_vpc_azs, 1):
      cidrsubnet(var.aws_vpc_cidr, 8, index)
  ]
  private_subnets = cidrsubnets(var.aws_vpc_cidr, 8, 8)
  database_subnets = var.aws_vpc_db_subnets

  enable_dns_hostnames  = true
  enable_dns_support    = true

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = merge(
    tomap({"Name" = "Mastering Terraform VPC"}),
    var.mandatory_tags
  )
}






