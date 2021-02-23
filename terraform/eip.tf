resource "aws_eip" "nuxt-rails-ngw-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.nuxt-rails-igw]

  tags = {
    Name = "nuxt-rails-ngw-eip"
  }
}
