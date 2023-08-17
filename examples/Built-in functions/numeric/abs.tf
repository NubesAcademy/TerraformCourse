variable "desired_node_count" {
  default = 10
}

variable "current_node_count" {
  default = 15
}

locals {
  node_count_difference = abs(var.desired_node_count - var.current_node_count)
}

output "abs_function" {
  value = local.node_count_difference
}
