resource "aws_vpc_peering_connection" "onprem_to_production" {
  vpc_id      = aws_vpc.onprem.id
  peer_vpc_id = aws_vpc.production.id
  auto_accept = true

  tags = merge(local.common_tags, {
    Name = "onprem-to-production-peering"
  })
}
