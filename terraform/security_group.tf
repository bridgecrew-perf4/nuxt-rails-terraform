resource "aws_security_group" "nuxt-rails-ecs-sg" {
  name   = "nuxt-rails-ecs-sg"
  vpc_id = aws_vpc.nuxt-rails-vpc.id

  tags = {
    Name = "nuxt-rails-ecs-sg"
  }
}

resource "aws_security_group_rule" "nuxt-rails-sg-ingress1" {
  description       = "nuxt rails sg ingress1"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}

resource "aws_security_group_rule" "nuxt-rails-sg-ingress2" {
  description       = "nuxt rails sg ingress2"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}

resource "aws_security_group_rule" "nuxt-rails-sg-ingress3" {
  description       = "nuxt rails sg ingress3"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}

resource "aws_security_group_rule" "nuxt-rails-sg-egress" {
  description       = "nuxt rails sg egress"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}

resource "aws_security_group" "nuxt-rails-rds-sg" {
  description = "nuxt rails rds security group"
  name        = "nuxt-rails-rds-security-group"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
}

resource "aws_security_group" "nuxt-rails-alb-sg" {
  name        = "nuxt-rails-alb-sg"
  description = "ALB security group for nuxt rails"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
}
