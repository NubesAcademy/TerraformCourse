// Quoted strings
variable "instance_type" {
  description = "The type of EC2 instance"
  type = string
  default     = "t2.micro"
}

// Heredoc strings
output "instance_info" {
  value = <<EOF
Instance ID: i-nf98432fudbfds
Instance Type: t3a.micro
EOF
}

// Interpolation
resource "aws_instance" "example" {
  ami           = "ami-kjsafiu34f4q34"
  instance_type = "${var.instance_type}"
}
