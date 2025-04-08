
resource "aws_launch_template" "LT" {
  name_prefix   = "web_template"
  image_id      = "ami-4513564654g46"
  instance_type = "t2.micro"
  key_name      = "Devopskey"

  user_data = base64encode(file("user_data.sh"))

    tags = {
      Name = "web-server"
    }
  }

resource "aws_autoscaling_group" "ASG" {
    desired_capacity = 2
    max_size = 3
    min_size = 1
    vpc_zone_identifier = [aws_subnet.publicsubnet1]
    launch_template {
    id = aws_launch_template.LT.id
    version = "$Latest"    
    }

  
}




