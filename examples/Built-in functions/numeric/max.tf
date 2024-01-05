variable "desired_instance_count" {
  default = 5
}

variable "minimum_instance_count" {
  default = 3
}

locals {
  desired_capacity = max(var.desired_instance_count, var.minimum_instance_count)
}

output "max_function" {
  value = local.desired_capacity
}
