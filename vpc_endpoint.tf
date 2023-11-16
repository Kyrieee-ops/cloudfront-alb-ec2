#------------------------------------
# VPC Endpoint
#------------------------------------
resource "aws_vpc_endpoint" "ssm" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cloudtech_vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ssm"
  subnet_ids = [
    aws_subnet.cloudtech_subnet_private1.id
  ]
  private_dns_enabled = true

  security_group_ids = [
    aws_security_group.cloudtech_vpc_endpoint_ssm_sg.id
  ]
  tags = {
    Name    = "${var.project}-ssm"
    Project = var.project
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cloudtech_vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ssmmessages"
  subnet_ids = [
    aws_subnet.cloudtech_subnet_private1.id
  ]
  private_dns_enabled = true
  security_group_ids = [
    aws_security_group.cloudtech_vpc_endpoint_ssm_sg.id
  ]
  tags = {
    Name    = "${var.project}-ssmmessages"
    Project = var.project
  }

}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cloudtech_vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ec2messages"
  subnet_ids = [
    aws_subnet.cloudtech_subnet_private1.id
  ]
  private_dns_enabled = true
  security_group_ids = [
    aws_security_group.cloudtech_vpc_endpoint_ssm_sg.id
  ]
  tags = {
    Name    = "${var.project}-ec2messages"
    Project = var.project
  }
}