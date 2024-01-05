// Dynamic Resource Creation Based on Input Data

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
}

resource "aws_security_group_rule" "example" {
  count = length(var.cidr_blocks)
  cidr_blocks = [var.cidr_blocks[count.index]]
  # other configurations
}
