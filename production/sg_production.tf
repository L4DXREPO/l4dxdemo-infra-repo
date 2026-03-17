# Production SG — commented out until AD and app setup is complete on on-prem side
#
# resource "aws_security_group" "production" {
#   name        = "production-sg"
#   description = "Production SG - admin inbound access and full egress"
#   vpc_id      = aws_vpc.production.id
#
#   ingress {
#     description = "RDP"
#     protocol    = "tcp"
#     from_port   = 3389
#     to_port     = 3389
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "SSH"
#     protocol    = "tcp"
#     from_port   = 22
#     to_port     = 22
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "LDAP"
#     protocol    = "tcp"
#     from_port   = 389
#     to_port     = 389
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "LDAPS"
#     protocol    = "tcp"
#     from_port   = 636
#     to_port     = 636
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "Kerberos TCP"
#     protocol    = "tcp"
#     from_port   = 88
#     to_port     = 88
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "Kerberos UDP"
#     protocol    = "udp"
#     from_port   = 88
#     to_port     = 88
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "DNS TCP"
#     protocol    = "tcp"
#     from_port   = 53
#     to_port     = 53
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     description = "DNS UDP"
#     protocol    = "udp"
#     from_port   = 53
#     to_port     = 53
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     description = "All outbound"
#     protocol    = "-1"
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   tags = merge(local.common_tags, {
#     Name = "production-sg"
#   })
# }
