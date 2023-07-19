data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "Mastering Terraform"
  azs = slice(data.aws_availability_zones.available.names, 0, var.aws_vpc_azs)

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

module "dns" {
  source = "./modules/dns"

  domain_name = var.domain_name
  mandatory_tags = var.mandatory_tags
}

module "ssl_certificate" {
  source = "./modules/ssl"

  domain_name = var.domain_name
  domain_zone_id = module.dns.domain_zone_id
  mandatory_tags = var.mandatory_tags
}

module "bastion_host" {
  source = "./modules/bastion"

  aws_vpc_id = module.vpc.vpc_id
  aws_ami = var.aws_bastion_ami
  aws_ec2_type = var.aws_bastion_ec2_type
  aws_vpc_public_subnets = module.vpc.public_subnets
  mandatory_tags = var.mandatory_tags
  domain_zone_id = module.dns.domain_zone_id
}

module "storage" {
  source = "./modules/storage"

  aws_vpc_id = module.vpc.vpc_id
  aws_region = var.aws_region
  aws_vpc_route_tables = module.vpc.private_route_table_ids
  s3_bucket_name = var.s3_bucket_name
  mandatory_tags = var.mandatory_tags
}

module "application" {
  source = "./modules/application"

  aws_vpc_id = module.vpc.vpc_id
  aws_vpc_public_subnets = module.vpc.public_subnets
  aws_vpc_private_subnets = module.vpc.private_subnets
  aws_ami = var.aws_app_ami
  aws_ec2_type = var.aws_app_ec2_type
  mandatory_tags = var.mandatory_tags
  bastion_security_group_id = module.bastion_host.bastion_security_group_id
  app_key_pair_name = module.bastion_host.app_key_pair_name
  domain_zone_id = module.dns.domain_zone_id
  ssl_certificate_arn = module.ssl_certificate.ssl_certificate_arn
}

module "database" {
  source = "./modules/database"

  aws_vpc_id = module.vpc.vpc_id
  aws_vpc_db_subnets = module.vpc.database_subnets
  aws_sg_app_id = module.application.sg_app_id
  aws_db_type = var.aws_db_type
  aws_db_name = var.aws_db_name
  mandatory_tags = var.mandatory_tags
}
#
#module "cdn" {
#  source = "./modules/cdn"
#
#
#}
