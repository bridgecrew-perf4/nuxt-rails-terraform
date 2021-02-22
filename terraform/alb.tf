resource "aws_lb" "nuxt-rails-alb" {
  name                       = "nuxt-rails-alb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.nuxt-rails-public-1a.id,
    aws_subnet.nuxt-rails-public-1c.id
  ]

  security_groups = [
    aws_security_group.nuxt-rails-alb-sg.id
  ]

  tags = {
    Name = "nuxt-rails-alb"
  }
}

resource "aws_lb_listener" "nuxt-rails-http-listener" {
  load_balancer_arn = aws_lb.nuxt-rails-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "nuxt-rails-https-listener" {
  load_balancer_arn = aws_lb.nuxt-rails-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.nuxt-rails-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.nuxt-alb-tg.arn
    type             = "forward"
  }
}


resource "aws_lb_listener" "rails-listener" {
  load_balancer_arn = aws_lb.nuxt-rails-alb.arn
  port              = "8080"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.nuxt-rails-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.rails-alb-tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "nuxt-alb-tg" {
  name        = "nuxt-alb-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 120
    interval            = 150
    matcher             = 200
    port                = 80
    protocol            = "HTTP"
  }
}
resource "aws_lb_target_group" "rails-alb-tg" {
  name        = "rails-alb-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
  port        = 8080
  protocol    = "HTTP"

  health_check {
    enabled             = true
    interval            = 60
    path                = "/v1/tasks"
    port                = 8080
    protocol            = "HTTP"
    matcher             = 200
    timeout             = 50
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}