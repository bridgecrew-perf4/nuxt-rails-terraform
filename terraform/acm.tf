resource "aws_acm_certificate" "nuxt-rails-acm" {
  domain_name               = aws_route53_record.nuxt-rails-host-zone-record.name
  subject_alternative_names = []
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_route53_record" "nuxt-rails-certificate" {
  name    = tolist(aws_acm_certificate.nuxt-rails-acm.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.nuxt-rails-acm.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.nuxt-rails-acm.domain_validation_options)[0].resource_record_value]
  zone_id = aws_route53_zone.nuxt-rails-host-zone.id
  ttl     = 60
}
resource "aws_acm_certificate_validation" "nuxt-rails-acm" {
  certificate_arn         = aws_acm_certificate.nuxt-rails-acm.arn
  validation_record_fqdns = [aws_route53_record.nuxt-rails-certificate.fqdn]
}
