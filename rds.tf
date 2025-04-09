resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin@123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.privatesubnet1.id, aws_subnet.privatesubnet2.id]

  tags ={
    Name = "My DB subnet Group"
  }
  
}