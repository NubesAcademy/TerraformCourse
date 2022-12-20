output "lb_endpoint" {
  value = "https://${aws_lb.app.dns_name}"
}

output "application_endpoint" {
  value = "https://${aws_lb.app.dns_name}/index.php"
}

output "asg_name" {
  value = aws_autoscaling_group.app.name
}

output "sg_lb_id" {
  value = aws_security_group.app_lb.id
}

output "sg_app_id" {
  value = aws_security_group.app_instance.id
}
