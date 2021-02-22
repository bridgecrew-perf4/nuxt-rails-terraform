
resource "aws_internet_gateway" "nuxt-rails-igw" {
  vpc_id = aws_vpc.nuxt-rails-vpc.id

  tags = {
    Name = "nuxt-rails-igw"
  }
}
