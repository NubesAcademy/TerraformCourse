variable "instances" {
  description = "Map of EC2 instances to create with their associated tags"
  type        = map(map(string))
  default     = {
    instance1 = { "Name" = "Instance1", "Environment" = "Test" },
    instance2 = { "Name" = "Instance2", "Environment" = "Production" }
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"

  dynamic "tag" {
    for_each = var.instances
    content {
      key   = tag.key
      value = tag.value
    }
  }
}
