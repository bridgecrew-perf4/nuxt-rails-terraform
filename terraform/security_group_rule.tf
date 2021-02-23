#########################
# SecurityGroupRule RDS #
#########################
resource "aws_security_group_rule" "nuxt-rails-rds-sg-rule1" {
  description       = "nuxt rails rds sg rule"
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.nuxt-rails-rds-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-rds-sg-rule2" {
  description       = "nuxt rails rds sg rule2"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-rds-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-rds-sg-rule3" {
  description       = "nuxt rails rds sg rule3"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.nuxt-rails-rds-sg.id
}

#########################
# SecurityGroupRule ALB #
#########################
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule1" {
  description       = "nuxt-rails-alb-sg-rule1"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule2" {
  description       = "nuxt-rails-alb-sg-rule2"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule3" {
  description       = "nuxt-rails-alb-sg-rule3"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule4" {
  description       = "nuxt-rails-alb-sg-rule4"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule5" {
  description       = "nuxt-rails-alb-sg-rule5"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-alb-sg-rule6" {
  description       = "nuxt-rails-alb-sg-rule6"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-alb-sg.id
}

#########################
# SecurityGroupRule ECS #
#########################
resource "aws_security_group_rule" "nuxt-rails-sg-rule1" {
  description       = "nuxt rails sg ingress1"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule2" {
  description       = "nuxt rails sg ingress2"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule3" {
  description       = "nuxt rails sg ingress3"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule4" {
  description       = "nuxt rails sg ingress4"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule5" {
  description              = "nuxt rails sg ingress5"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.nuxt-rails-alb-sg.id
  security_group_id        = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule6" {
  description       = "nuxt rails sg ingress6"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}
resource "aws_security_group_rule" "nuxt-rails-sg-rule7" {
  description       = "nuxt rails sg ingress7"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nuxt-rails-ecs-sg.id
}