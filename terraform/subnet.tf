resource "aws_subnet" "nuxt-rails-public-1a" {
  vpc_id            = aws_vpc.nuxt-rails-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "nuxt-rails-public-1a"
  }
}

resource "aws_subnet" "nuxt-rails-public-1c" {
  vpc_id            = aws_vpc.nuxt-rails-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "nuxt-rails-public-1c"
  }
}

resource "aws_subnet" "nuxt-rails-private-1a" {
  vpc_id            = aws_vpc.nuxt-rails-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "nuxt-rails-private-1a"
  }
}

resource "aws_subnet" "nuxt-rails-private-1c" {
  vpc_id            = aws_vpc.nuxt-rails-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "nuxt-rails-private-1c"
  }
}

###############
# SubnetGroup #
###############
resource "aws_db_subnet_group" "nuxt-rails-rds-subnet-group" {
  name        = "nuxt-rails-rds-subnet-group"
  description = "nuxt rails rds subnet group"
  subnet_ids  = [aws_subnet.nuxt-rails-private-1a.id, aws_subnet.nuxt-rails-private-1c.id]
}
