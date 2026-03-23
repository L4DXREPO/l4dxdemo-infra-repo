resource "aws_instance" "onprem_standalone" {
  ami                         = "ami-095cc90aa5ddff518"
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.onprem_public.id
  vpc_security_group_ids      = [aws_security_group.onprem.id]
  key_name             = aws_key_pair.demo.key_name
  iam_instance_profile = aws_iam_instance_profile.mgn_agent.name

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(local.common_tags, {
    Name = "onprem-standalone-server"
  })
}
