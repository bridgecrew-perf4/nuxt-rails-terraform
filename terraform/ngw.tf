resource "aws_nat_gateway" "nuxt-rails-ngw" {
  allocation_id = aws_eip.nuxt-rails-ngw-eip.id
  subnet_id     = aws_subnet.nuxt-rails-public-1a.id
  depends_on    = [aws_internet_gateway.nuxt-rails-igw]

  tags = {
    Name = "gadget-ngw"
  }
}
