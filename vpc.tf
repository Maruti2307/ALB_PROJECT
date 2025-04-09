resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "publicsubnet1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-est-1a"
  
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "privatesubnet1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"

}

resource "aws_subnet" "privatesubnet2" {
    vpc_id = aws_vpc.myvpc.id
   cidr_block = "10.0.4.0/24"
   availability_zone = "us-east-1b"
  
}

resource "aws_internet_gateway" "IGW" {
 vpc_id = aws_vpc.myvpc.id

}

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.myvpc.id

route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.IGW.id
}

  
}

resource "aws_route_table_association" "publicsubnet1Asso" {
        subnet_id = aws_subnet.publicsubnet1.id
        route_table_id = aws_route_table.RT.id
 
}
resource "aws_route_table_association" "publicsubnet2Asso" {
        subnet_id = aws_subnet.publicsubnet2.id
        route_table_id = aws_route_table.RT.id
 
}   
