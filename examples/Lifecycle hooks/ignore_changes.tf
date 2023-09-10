// Lifecycle hooks
// This directive tells Terraform to ignore changes to specified attributes of a resource

resource "aws_instance" "example" {
  # ... other configuration ...

  lifecycle {
    ignore_changes = [ami, instance_type]
  }
}
