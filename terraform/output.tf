output "vpc_id" {
  value = aws_vpc.nuxt-rails-vpc.id
}

output "nuxt-rails-subnet_id" {
  value = aws_subnet.nuxt-rails-public-1a.id
}

output "nuxt-rails-igw_id" {
  value = aws_internet_gateway.nuxt-rails-igw.id
}