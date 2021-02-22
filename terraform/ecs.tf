resource "aws_ecs_cluster" "nuxt-rails-cluster" {
  name = "nuxt-rails-cluster"
}

resource "aws_ecs_service" "nuxt-service" {
  name             = "nuxt-service"
  cluster          = aws_ecs_cluster.nuxt-rails-cluster.arn
  task_definition  = aws_ecs_task_definition.nuxt-task.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.3.0"

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.nuxt-rails-ecs-sg.id
    ]
    subnets = [
      aws_subnet.nuxt-rails-public-1a.id,
      aws_subnet.nuxt-rails-public-1c.id,
    ]
  }
}

resource "aws_ecs_task_definition" "nuxt-task" {
  family                   = "nuxt-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./task/nuxt_container_definitions.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn

  tags = {
    Name = "nuxt-task"
  }
}

resource "aws_ecs_service" "rails-service" {
  name             = "rails-service"
  cluster          = aws_ecs_cluster.nuxt-rails-cluster.arn
  task_definition  = aws_ecs_task_definition.rails-task.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.3.0"

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.nuxt-rails-ecs-sg.id
    ]
    subnets = [
      aws_subnet.nuxt-rails-public-1a.id,
      aws_subnet.nuxt-rails-public-1c.id,
    ]
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

  tags = {
    Name = "rails-task"
  }
}

resource "aws_ecs_task_definition" "db-create" {
  family                   = "db-create"
  container_definitions    = file("./task/db_create_definitions.json")
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "db-migrate"
  container_definitions    = file("./task/db_migrate_definitions.json")
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate-reset" {
  family                   = "db-migrate-reset"
  container_definitions    = file("./task/db_migrate_reset_definitions.json")
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

# IAM
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
