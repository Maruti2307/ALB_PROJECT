resource "aws_lb" "LB" {
  name               = "weblb"
  internal           = false                                # Set to false for internet-facing
  load_balancer_type = "application"                        # ALB type
  security_groups    = [aws_security_group.websg.id]        # SG attached to the ALB
  subnets            = [
    aws_subnet.publicsubnet1.id,                            # Use correct subnet reference
    aws_subnet.publicsubnet2.id
  ]

  tags = {
    Name = "Web-ALB"
  }
}
