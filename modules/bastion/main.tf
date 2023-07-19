resource "aws_key_pair" "bastion" {
  key_name = "bastion-ssh-key"
  public_key = file("${path.module}/../../bastion_id_rsa.pub")
}

resource "tls_private_key" "app-rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "application" {
  key_name = "app-ssh-key"
  public_key = tls_private_key.app-rsa-key.public_key_openssh
}

resource "aws_security_group" "bastion" {
  name = "mastering-terraform-bastion"
  description = "Mastering Terraform Security Group for Bastion Host"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.aws_vpc_id
}

resource "aws_instance" "bastion" {
  ami = var.aws_ami
  instance_type = var.aws_ec2_type
  subnet_id = element(var.aws_vpc_public_subnets, 0)
  key_name = aws_key_pair.bastion.key_name
  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]
  ebs_optimized = true

  root_block_device {
    volume_type = "gp3"
    volume_size = "10"
    delete_on_termination = true
  }

  user_data = templatefile("${path.module}/user-data.sh", { ssh_private_key = tls_private_key.app-rsa-key.private_key_pem })

  tags = merge(
    tomap({"Name" = "Mastering Terraform Bastion"}),
    var.mandatory_tags
  )
  volume_tags = merge(
    tomap({"Name" = "Mastering Terraform Bastion"}),
    var.mandatory_tags
  )
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  vpc = true

  tags = merge(
    tomap({"Name" = "Mastering Terraform Bastion"}),
    var.mandatory_tags
  )
}

resource "aws_route53_record" "bastion-record-A" {
  zone_id = var.domain_zone_id
  name = "bastion"
  type = "A"
  ttl = "300"
  records = [aws_eip.bastion.public_ip]
}

