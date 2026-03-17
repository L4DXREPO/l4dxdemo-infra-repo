resource "aws_instance" "prod_dc" {
  ami                         = data.aws_ami.ubuntu_22_04.id
  instance_type               = "t3.large"
  subnet_id                   = aws_subnet.production_public.id
  vpc_security_group_ids      = [aws_security_group.production.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  tags = merge(local.common_tags, {
    Name = "prod-domain-controller"
    Role = "migration-target"
  })
}

resource "aws_instance" "prod_standalone" {
  ami                         = data.aws_ami.ubuntu_22_04.id
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.production_public.id
  vpc_security_group_ids      = [aws_security_group.production.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  tags = merge(local.common_tags, {
    Name = "prod-standalone-server"
    Role = "migration-target"
  })
}
