#############################################################
# SSMパラメータストア
#############################################################

#============================================================
# Common
#============================================================
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

resource "aws_ssm_parameter" "access-key-id" {
  name        = "access-key-id"
  value       = var.AWS_ACCESS_KEY_ID
  type        = "SecureString"
  description = "AWS_ACCESS_KEY_ID"
}
resource "aws_ssm_parameter" "secret-access-key" {
  name        = "secret-access-key"
  value       = var.AWS_SECRET_ACCESS_KEY
  type        = "SecureString"
  description = "AWS_SECRET_ACCESS_KEY"
}

#============================================================
# API
#============================================================
variable "API_PORT" {}
variable "DB_HOST" {}
variable "DB_NAME" {}
variable "DB_USERNAME" {}
variable "POSTGRES_PASSWORD" {}
variable "S3_REGION" {}
variable "S3_BUCKET" {}
variable "RAILS_MASTER_KEY" {}

resource "aws_ssm_parameter" "api-port" {
  name        = "api-port"
  value       = var.API_PORT
  type        = "SecureString"
  description = "API_PORT"
}

resource "aws_ssm_parameter" "db-host" {
  name        = "db"
  value       = var.DB_HOST
  type        = "SecureString"
  description = "DB_HOST"
}
resource "aws_ssm_parameter" "db-name" {
  name        = "next-rails-db"
  value       = var.DB_NAME
  type        = "SecureString"
  description = "DB_NAME"
}
resource "aws_ssm_parameter" "db-username" {
  name        = "root"
  value       = var.DB_USERNAME
  type        = "SecureString"
  description = "DB_USERNAME"
}
resource "aws_ssm_parameter" "password" {
  name        = "password"
  value       = var.POSTGRES_PASSWORD
  type        = "SecureString"
  description = "PASSWORD"
}
resource "aws_ssm_parameter" "postgres-password" {
  name        = "postgres-password"
  value       = var.POSTGRES_PASSWORD
  type        = "SecureString"
  description = "POSTGRES_PASSWORD"
}
resource "aws_ssm_parameter" "s3-region" {
  name = "s3-region"
  value = var.S3_REGION
  type = "SecureString"
  description = "S3_REGION"
}
resource "aws_ssm_parameter" "s3-bucket" {
  name = "s3-bucket"
  value = var.S3_BUCKET
  type = "SecureString"
  description = "S3_BUCKET"
}
resource "aws_ssm_parameter" "rails-master-key" {
  name = "rails-master-key"
  value = var.RAILS_MASTER_KEY
  type = "SecureString"
  description = "RAILS_MASTER_KEY"
}

#============================================================
# FRONT
#============================================================
variable "WORKDIR" {}
variable "FRONT_PORT" {}
variable "CONTAINER_PORT" {}

resource "aws_ssm_parameter" "workdir" {
  name        = "workdir"
  value       = var.WORKDIR
  type        = "SecureString"
  description = "WORKDIR"
}

resource "aws_ssm_parameter" "front-port" {
  name        = "front-port"
  value       = var.FRONT_PORT
  type        = "SecureString"
  description = "FRONT_PORT"
}
resource "aws_ssm_parameter" "container-port" {
  name        = "container-port"
  value       = var.CONTAINER_PORT
  type        = "SecureString"
  description = "CONTAINER_PORT"
}

#============================================================
# CodePipeline
#============================================================
variable "GITHUB_TOKEN" {}
variable "GITHUB_USER" {}
variable "GITHUB_REPO" {}
variable "GITHUB_BRANCH" {}
variable "WEBHOOK_TOKEN" {}
variable "DOCKERHUB_USER" {}
variable "DOCKERHUB_PASS" {}

resource "aws_ssm_parameter" "github-token" {
  name        = "github-token"
  value       = var.GITHUB_TOKEN
  type        = "SecureString"
  description = "GITHUB_TOKEN"
}
resource "aws_ssm_parameter" "github-user" {
  name        = "github-user"
  value       = var.GITHUB_USER
  type        = "SecureString"
  description = "GITHUB_USER"
}
resource "aws_ssm_parameter" "github-repo" {
  name        = "github-repo"
  value       = var.GITHUB_REPO
  type        = "SecureString"
  description = "GITHUB_REPO"
}
resource "aws_ssm_parameter" "github-branch" {
  name        = "github-branch"
  value       = var.GITHUB_BRANCH
  type        = "SecureString"
  description = "GITHUB_BRANCH"
}
resource "aws_ssm_parameter" "webhook-token" {
  name        = "webhook-token"
  value       = var.WEBHOOK_TOKEN
  type        = "SecureString"
  description = "WEBHOOK_TOKEN"
}
resource "aws_ssm_parameter" "dockerhub-user" {
  name        = "dockerhub-user"
  value       = var.DOCKERHUB_USER
  type        = "SecureString"
  description = "DOCKERHUB_USER"
}
resource "aws_ssm_parameter" "dockerhub-pass" {
  name        = "dockerhub-pass"
  value       = var.DOCKERHUB_PASS
  type        = "SecureString"
  description = "DOCKERHUB_PASS"
}