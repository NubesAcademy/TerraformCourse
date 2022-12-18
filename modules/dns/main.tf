resource "aws_route53_zone" "domain" {
  name = var.domain_name

  tags = merge(
    tomap({"Name" = "Mastering Terraform Domain Zone"}),
    var.mandatory_tags
  )
}
