// Lifecycle hooks
// Terraform will refuse to destroy the resource

resource "aws_instance" "example" {
  # ... other configuration ...

  lifecycle {
    prevent_destroy = true
  }
}
