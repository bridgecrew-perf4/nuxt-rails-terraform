resource "aws_route_table" "nuxt-rails-public-rt" {
  vpc_id = aws_vpc.nuxt-rails-vpc.id

  route {
    gateway_id = aws_internet_gateway.nuxt-rails-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "nuxt-rails-public-rt"
  }
}

resource "aws_route_table_association" "nuxt-rails-public-rt-1a" {
  subnet_id      = aws_subnet.nuxt-rails-public-1a.id
  route_table_id = aws_route_table.nuxt-rails-public-rt.id
}

resource "aws_route_table_association" "nuxt-rails-public-rt-1c" {
  subnet_id      = aws_subnet.nuxt-rails-public-1c.id
  route_table_id = aws_route_table.nuxt-rails-public-rt.id
}