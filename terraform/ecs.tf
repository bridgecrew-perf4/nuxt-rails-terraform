###########
#   ECS   #
###########
resource "aws_ecs_cluster" "nuxt-rails-cluster" {
  name = "nuxt-rails-cluster"
}
resource "aws_ecs_task_definition" "nuxt-task" {
  family                   = "nuxt-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./task/nuxt_container_definitions.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_service" "nuxt-service" {
  name                              = "nuxt-service"
  cluster                           = aws_ecs_cluster.nuxt-rails-cluster.arn
  task_definition                   = aws_ecs_task_definition.nuxt-task.arn
  desired_count                     = 2
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.nuxt-rails-ecs-sg.id
    ]
    subnets = [
      aws_subnet.nuxt-rails-public-1a.id,
      aws_subnet.nuxt-rails-public-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nuxt-alb-tg.arn
    container_name   = "nuxt-container"
    container_port   = "80"
  }
}

resource "aws_ecs_task_definition" "rails-task" {
  family                   = "rails-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./task/rails_container_definitions.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_service" "rails-service" {
  name             = "rails-service"
  cluster          = aws_ecs_cluster.nuxt-rails-cluster.arn
  task_definition  = aws_ecs_task_definition.rails-task.arn
  desired_count    = 2
  launch_type      = "FARGATE"
  platform_version = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.nuxt-rails-ecs-sg.id
    ]
    subnets = [
      aws_subnet.nuxt-rails-public-1a.id,
      aws_subnet.nuxt-rails-public-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.rails-alb-tg.arn
    container_name   = "rails-container"
    container_port   = "3000"
  }
}

resource "aws_ecs_task_definition" "db-create" {
  family                   = "db-create"
  container_definitions    = file("./task/db_create_definitions.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "db-migrate"
  container_definitions    = file("./task/db_migrate_definitions.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate-reset" {
  family                   = "db-migrate-reset"
  container_definitions    = file("./task/db_migrate_reset_definitions.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

##########
#  権限   #
##########
data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

module "ecs_task_execution_role" {
  source     = "./modules/iam_role"
  name       = "nuxt-rails-ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}
