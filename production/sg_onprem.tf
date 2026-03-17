resource "aws_security_group" "onprem" {
  name        = "onprem-sg"
  description = "On-prem simulation SG - egress only for MGN agent traffic"
  vpc_id      = aws_vpc.onprem.id

  egress {
    description = "HTTPS to AWS"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "MGN replication traffic"
    protocol    = "tcp"
    from_port   = 1500
    to_port     = 1500
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "onprem-sg"
  })
}
