# This section creates a certificate, public zone and validate the certificate using DNS methods
resource "aws_acm_certificate" "bb" {
  domain_name       = "*.bbwest.online"
  validation_method = "DNS"
}

# Calling the hosted zone (NB: you must have created it first in aws) 
data "aws_route53_zone" "bb" {
  name         = "bbwest.online"
  private_zone = false
}

# Selecting validation method
resource "aws_route53_record" "bb" {
  for_each = {
    for dvo in aws_acm_certificate.bb.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }

  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.bb.zone_id
}

#Validate the certificate through DNS method
resource "aws_acm_certificate_validation" "bb" {
  certificate_arn         = aws_acm_certificate.bb.arn
  validation_record_fqdns = [for record in aws_route53_record.bb : record.fqdn]
}

#create records for tooling
resource "aws_route53_record" "tooling" {
  zone_id = data.aws_route53_zone.bb.zone_id
  name    = "tooling.bbwest.online"
  type    = "A"

  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }

}

# Create records for wordpress
resource "aws_route53_record" "wordpress" {
  zone_id = data.aws_route53_zone.bb.zone_id
  name    = "wordpress.bbwest.online"
  type    = "A"
  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }
}