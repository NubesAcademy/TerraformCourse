resource "aws_instance" "example" {
  #...
  tags = {
    Name = "example-instance"
    CreationTime = timestamp()
  }
  #...
}
