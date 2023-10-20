# create DB subnet group from the private subnets
resource "aws_db_subnet_group" "BB-rds" {
  name       = "bb-rds"
  subnet_ids = var.private_subnets

  tags = merge(
    var.tags,
    {
      Name = "BB-database"
    },
  )
}

# create the RDS instance with the subnets group
resource "aws_db_instance" "BB-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  #name                   = "BABADE"
  username               = var.db-username
  password               = var.db-password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.BB-rds.name
  skip_final_snapshot    = true
  vpc_security_group_ids = var.db-sg
  multi_az               = "true"
}
