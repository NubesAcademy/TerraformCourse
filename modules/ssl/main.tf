resource "aws_acm_certificate" "app" {
  domain_name = var.domain_name
  subject_alternative_names = [
    "*.${var.domain_name}"
  ]
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    tomap({"Name" = "Mastering Terraform SSL Certificate"}),
    var.mandatory_tags
  )
}

resource "aws_route53_record" "ssl-validation" {
  zone_id = var.domain_zone_id
  ttl = "300"

  name = aws_acm_certificate.app.domain_validation_options.0.resource_record_name
  type = aws_acm_certificate.app.domain_validation_options.0.resource_record_type
  records = [
    aws_acm_certificate.app.domain_validation_options.0.resource_record_value
  ]
}

resource "aws_acm_certificate_validation" "ssl-validation" {
  certificate_arn = aws_acm_certificate.app.arn
  validation_record_fqdns = [aws_route53_record.ssl-validation.fqdn]
}
