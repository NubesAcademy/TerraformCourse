variable "vpc_security_group_ids" {
  default = ["sg-012345678", "sg-987654321"]
}

locals {
  command = "echo The instance has ${length(var.vpc_security_group_ids)} security groups attached"
}

output "length_function" {
  value = local.command
}
