data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = [var.aws_ami]
  }
}


resource "aws_security_group" "app_lb" {
  name = "mastering-terraform-lb"
  description = "Mastering Terraform Security Group for LoadBalancer"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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

resource "aws_security_group" "app_instance" {
  name = "mastering-terraform-instance"
  description = "Mastering Terraform Security Group for EC2 Instances"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.app_lb.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.app_lb.id]
  }

  vpc_id = var.aws_vpc_id
}

resource "aws_launch_configuration" "app" {
  name_prefix     = "mastering-terraform-aws-asg-"
  image_id        = data.aws_ami.amazon-linux.id
  instance_type   = var.aws_ec2_type
  user_data       = file("user-data.sh")
  security_groups = [aws_security_group.app_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  name                 = "app"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.app.name
  vpc_zone_identifier  = var.aws_vpc_private_subnets

  tag {
    key                 = "Name"
    value               = "Mastering Terraform App Server"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.mandatory_tags

    content {
      key     =  tag.key
      value   =  tag.value
      propagate_at_launch =  true
    }
  }
}

resource "aws_lb" "app" {
  name               = "mastering-terraform-asg-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_lb.id]
  subnets            = var.aws_vpc_public_subnets
}

resource "aws_lb_target_group" "app" {
  name     = "mastering-terraform-app"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

resource "aws_autoscaling_attachment" "terramino" {
  autoscaling_group_name = aws_autoscaling_group.app.id
  lb_target_group_arn   = aws_lb_target_group.app.arn
}
