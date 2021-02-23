// front
variable "FRONT_PORT" {}

resource "aws_ssm_parameter" "front-port" {
  name = "front-port"
  value = var.FRONT_PORT
  type = "SecureString"
  description = "FRONT_PORT"
}


// api
variable "API_PORT" {}
variable "DB_HOST" {}
variable "DB_NAME" {}
variable "DB_USERNAME" {}
variable "POSTGRES_PASSWORD" {}

resource "aws_ssm_parameter" "api-port" {
  name = "api-port"
  value = var.API_PORT
  type = "SecureString"
  description = "API_PORT"
}

resource "aws_ssm_parameter" "db-host" {
  name = "db"
  value = var.DB_HOST
  type = "SecureString"
  description = "DB_HOST"
}
resource "aws_ssm_parameter" "db-name" {
  name = "next-rails-db"
  value = var.DB_NAME
  type = "SecureString"
  description = "DB_NAME"
}
resource "aws_ssm_parameter" "db-username" {
  name = "root"
  value = var.DB_USERNAME
  type = "SecureString"
  description = "DB_USERNAME"
}
resource "aws_ssm_parameter" "postgres-password" {
  name = "postgres-password"
  value = var.POSTGRES_PASSWORD
  type = "SecureString"
  description = "POSTGRES_PASSWORD"
}

// pipeline
variable "GITHUB_TOKEN" {}
variable "GITHUB_USER" {}
variable "GITHUB_REPO" {}
variable "GITHUB_BRANCH" {}
variable "WEBHOOK_TOKEN" {}

resource "aws_ssm_parameter" "github-token" {
  name = "github-token"
  value = var.GITHUB_TOKEN
  type = "SecureString"
  description = "GITHUB_TOKEN"
}
resource "aws_ssm_parameter" "github-user" {
  name = "github-user"
  value = var.GITHUB_USER
  type = "SecureString"
  description = "GITHUB_USER"
}
resource "aws_ssm_parameter" "github-repo" {
  name = "github-repo"
  value = var.GITHUB_REPO
  type = "SecureString"
  description = "GITHUB_REPO"
}
resource "aws_ssm_parameter" "github-branch" {
  name = "github-branch"
  value = var.GITHUB_BRANCH
  type = "SecureString"
  description = "GITHUB_BRANCH"
}
resource "aws_ssm_parameter" "webhook-token" {
  name = "webhook-token"
  value = var.WEBHOOK_TOKEN
  type = "SecureString"
  description = "WEBHOOK_TOKEN"
}