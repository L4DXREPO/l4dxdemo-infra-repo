resource "aws_eip" "prod_dc" {
  instance = aws_instance.prod_dc.id
  domain   = "vpc"

  tags = merge(local.common_tags, {
    Name = "prod-domain-controller-eip"
  })
}

resource "aws_eip" "onprem_standalone" {
  instance = aws_instance.onprem_standalone.id
  domain   = "vpc"

  tags = merge(local.common_tags, {
    Name = "onprem-standalone-server-eip"
  })
}
