resource "aws_cloudwatch_log_group" "ecs-nuxt" {
  name              = "/ecs/nuxt"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_group" "ecs-rails" {
  name              = "/ecs/rails"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_group" "ecs-db-create" {
  name              = "/ecs/db-create"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_group" "ecs-db-migrate" {
  name              = "/ecs/db-migrate"
  retention_in_days = 180
}

resource "aws_cloudwatch_log_group" "ecs-db-migrate-reset" {
  name              = "/ecs/db-migrate-reset"
  retention_in_days = 180
}