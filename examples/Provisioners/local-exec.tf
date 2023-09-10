// Terraform local provisioner

// Print "Hello, World" to file example.txt
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello, World > example.txt"
  }
}

// Print Private IP address of EC2 instance to file ips.txt
resource "aws_instance" "example" {
  // ...
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> ips.txt"
  }
}
