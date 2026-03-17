# Production EC2 instances — commented out until AD and app setup is complete on on-prem side
#
# resource "aws_instance" "prod_dc" {
#   ami                         = data.aws_ami.windows_server_2022.id
#   instance_type               = "t3.large"
#   subnet_id                   = aws_subnet.production_public.id
#   vpc_security_group_ids      = [aws_security_group.production.id]
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.demo.key_name
#
#   root_block_device {
#     volume_size = 50
#     volume_type = "gp3"
#   }
#
#   tags = merge(local.common_tags, {
#     Name = "prod-domain-controller"
#     Role = "migration-target"
#   })
# }
#
# resource "aws_instance" "prod_standalone" {
#   ami                         = data.aws_ami.ubuntu_22_04.id
#   instance_type               = "t3.medium"
#   subnet_id                   = aws_subnet.production_public.id
#   vpc_security_group_ids      = [aws_security_group.production.id]
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.demo.key_name
#
#   tags = merge(local.common_tags, {
#     Name = "prod-standalone-server"
#     Role = "migration-target"
#   })
# }
