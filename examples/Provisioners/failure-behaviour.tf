// Failure Behaviour for Provisioners

// on_failure = "continue"
// if the local-exec provisioner fails, Terraform will still create the aws_instance resource.

resource "aws_instance" "example" {
  // ...

  provisioner "local-exec" {
    command = "echo 'The instance ID is '${self.id}"
    on_failure = "continue"
  }
}

// on_failure = "fail"
// if the local-exec provisioner fails, Terraform will stop the creation of the aws_instance resource and exit.

resource "aws_instance" "example" {
  // ...

  provisioner "local-exec" {
    command = "echo 'The instance ID is '${self.id}"
    on_failure = "fail"
  }
}
