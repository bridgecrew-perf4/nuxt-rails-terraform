##########
#   S3   #
##########
resource "aws_s3_bucket" "nuxt-rails-s3-bucket" {
  bucket = "nuxt-rails-s3-bucket-for-images"
  acl    = "public-read"

  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
  }

  tags = {
    Name = "nuxt-rails-s3-bucket-for-images"
  }
}
resource "aws_s3_bucket" "artifact" {
  bucket = "artifact-pragmatic-terraform-for-nuxt-rails"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}