#------------------------------------
# ALB
#------------------------------------
resource "aws_lb" "cloudtech_alb" {
  name               = "${var.project}-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.cloudtech_web_sg.id
  ]
  subnets = [
    aws_subnet.cloudtech_subnet_public1.id,
    aws_subnet.cloudtech_subnet_public2.id
  ]
}