// Resource Dependencies Beyond Attribute Reference

resource "aws_elastic_beanstalk_environment" "example" {
  # ...
}

resource "aws_route53_record" "www" {
  # ...
  depends_on = [aws_elastic_beanstalk_environment.example]
}
