locals {
  base_cidr = "10.0.0.0/16"
  netmask = cidrnetmask(local.base_cidr)
}

output "cidrnetmask_function" {
  value = local.netmask
}
