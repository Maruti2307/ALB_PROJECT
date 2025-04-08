resource "aws_security_group" "asg" {
  ingress{

  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"

  }

}

resource "aws_security_group" "rds" {
 vpc_id = aws_vpc.myvpc.id
 ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = "10.0.0.1/24"

 }
  
}
