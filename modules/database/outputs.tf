output "db_hostname" {
  value = "${aws_rds_cluster.mysql.endpoint}"
}

output "db_login" {
  value = "${aws_rds_cluster.mysql.master_username}"
}

output "db_password" {
  value = "${aws_rds_cluster.mysql.master_password}"
}
