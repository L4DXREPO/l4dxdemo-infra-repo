resource "aws_security_group" "onprem" {
  name        = "onprem-sg"
  description = "On-prem simulation SG - all traffic inbound and outbound"
  vpc_id      = aws_vpc.onprem.id

  ingress {
    description = "All inbound"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "onprem-sg"
  })
}
