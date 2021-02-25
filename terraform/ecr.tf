#########
#  ECR  #
#########

#__________  api  __________#
resource "aws_ecr_repository" "rails" {
  name = "rails-ecr"
}
resource "aws_ecr_lifecycle_policy" "rails-policy" {
  repository = aws_ecr_repository.rails.name

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 release tagged images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["latest"],
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}

#__________ front __________#
resource "aws_ecr_repository" "nuxt" {
  name = "nuxt-ecr"
}
resource "aws_ecr_lifecycle_policy" "nuxt-policy" {
  repository = aws_ecr_repository.nuxt.name

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 release tagged images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["latest"],
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}