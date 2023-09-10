// Lifecycle hooks
// This directive instructs Terraform to create the new version of a resource before destroying the old one during an update

resource "aws_instance" "example" {
  # ... other configuration ...

  lifecycle {
    create_before_destroy = true
  }
}
