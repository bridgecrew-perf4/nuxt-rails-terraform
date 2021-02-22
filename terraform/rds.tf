# RDS
resource "aws_db_subnet_group" "praivate-db" {
    name        = "praivate-db"
    subnet_ids  = ["${aws_subnet.nuxt-rails-private-1a.id}", "${aws_subnet.nuxt-rails-private-1c.id}"]
    tags = {
        Name = "praivate-db"
    }
}

resource "aws_db_instance" "nuxt-rails-db" {
  identifier           = "next-rails-db"
  allocated_storage    = 20
  engine            = "postgres"
  engine_version    = "12.3"
  storage_type      = "gp2"
  instance_class       = "db.t3.micro"
  username             = "next_rails_username"
  password             = "next_rails_password"
  vpc_security_group_ids  = [aws_security_group.nuxt-rails-rds-sg.id]
  db_subnet_group_name    = aws_db_subnet_group.nuxt-rails-rds-subnet-group.name
  skip_final_snapshot = true
}