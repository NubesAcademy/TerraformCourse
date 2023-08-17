variable "instance_arn" {
  default = "arn:aws:ec2:us-west-2:123456789012:instance/i-1234567890abcdef0"
}

locals {
  instance_id = substr(var.instance_arn, length(var.instance_arn) - 19, 19)
}

output "substr_function" {
  value = local.instance_id
}
