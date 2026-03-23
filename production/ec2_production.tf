resource "aws_instance" "prod_dc" {
  ami                         = "ami-0ccffca673454bcc3"
  instance_type               = "t3.large"
  subnet_id                   = aws_subnet.production_public.id
  vpc_security_group_ids      = [aws_security_group.production.id]
  key_name = aws_key_pair.demo.key_name

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
  key_name = aws_key_pair.demo.key_name

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(local.common_tags, {
    Name = "prod-standalone-server"
    Role = "app-server"
  })
}
