resource "aws_security_group" "production" {
  name        = "production-sg"
  description = "Production SG - all traffic inbound and outbound"
  vpc_id      = aws_vpc.production.id

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
    Name = "production-sg"
  })
}
