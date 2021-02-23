#####################
# SecurityGroup RDS #
#####################
resource "aws_security_group" "nuxt-rails-ecs-sg" {
  name   = "nuxt-rails-ecs-sg"
  vpc_id = aws_vpc.nuxt-rails-vpc.id

  tags = {
    Name = "nuxt-rails-ecs-sg"
  }
}

#####################
# SecurityGroup ALB #
#####################
resource "aws_security_group" "nuxt-rails-rds-sg" {
  description = "nuxt rails rds security group"
  name        = "nuxt-rails-rds-security-group"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
}

#####################
# SecurityGroup ECS #
#####################
resource "aws_security_group" "nuxt-rails-alb-sg" {
  name        = "nuxt-rails-alb-sg"
  description = "ALB security group for nuxt rails"
  vpc_id      = aws_vpc.nuxt-rails-vpc.id
}
