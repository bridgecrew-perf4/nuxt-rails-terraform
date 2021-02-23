// resource "aws_route53_zone" "nuxt-rails-host-zone" {
//   name    = "nuxt-rails.com"
//   comment = "nuxt-rails.com host zone"
// }

// resource "aws_route53_record" "nuxt-rails-host-zone-record" {
//   zone_id = aws_route53_zone.nuxt-rails-host-zone.zone_id
//   name    = aws_route53_zone.nuxt-rails-host-zone.name
//   type    = "A"

//   alias {
//     name                   = aws_lb.nuxt-rails-alb.dns_name
//     zone_id                = aws_lb.nuxt-rails-alb.zone_id
//     evaluate_target_health = true
//   }
// }
