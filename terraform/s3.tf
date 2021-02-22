resource "aws_s3_bucket" "artifact" {
  bucket = "artifact-pragmatic-terraform-for-nuxt-rails"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}