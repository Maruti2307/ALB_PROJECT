resource "aws_lb" "LB" {
    name = "weblb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.asg.id]
    subnets = [aws_publicsubnet1.id, aws_subnet.publicsubnet2.id]
  
}