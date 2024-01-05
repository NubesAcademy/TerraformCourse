locals {
  base_cidr = "10.0.0.0/16"
  subnet = cidrsubnet(local.base_cidr, 8, 1)
}

output "cidrsubnet_function" {
  value = local.subnet
}

