resource "aws_ecr_repository" "nuxt" {
  name = "nuxt-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "rails" {
  name = "rails-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }
}