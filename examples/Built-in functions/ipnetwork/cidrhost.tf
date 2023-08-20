locals {
  subnet = "10.0.1.0/24"
  host = cidrhost(local.subnet, 4)
}

output "cidrhost_function" {
  value = local.host
}
