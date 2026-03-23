resource "aws_instance" "prod_dc" {
  ami                         = "ami-038b0fc52513087d0"
  instance_type               = "t3.large"
  subnet_id                   = aws_subnet.production_public.id
  vpc_security_group_ids      = [aws_security_group.production.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "prod-domain-controller"
    Role = "dc-extension"
  })
}

resource "aws_instance" "prod_standalone" {
  ami                         = "ami-095cc90aa5ddff518"
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.production_public.id
  vpc_security_group_ids      = [aws_security_group.production.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  tags = merge(local.common_tags, {
    Name = "prod-standalone-server"
    Role = "app-server"
  })
}
