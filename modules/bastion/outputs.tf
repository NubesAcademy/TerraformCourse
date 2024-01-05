output "bastion_security_group_id" {
  value = aws_security_group.bastion.id
}

output "app_key_pair_name" {
  value = aws_key_pair.application.key_name
}
