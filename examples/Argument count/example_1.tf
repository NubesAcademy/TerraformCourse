// Creating Multiple Similar Resources

resource "aws_instance" "example" {
  count = 5
  # other configurations
}
