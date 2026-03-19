resource "aws_vpc" "onprem" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "onprem-vpc"
  })
}

resource "aws_subnet" "onprem_public" {
  vpc_id            = aws_vpc.onprem.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"

  tags = merge(local.common_tags, {
    Name = "onprem-public-subnet"
  })
}

resource "aws_internet_gateway" "onprem" {
  vpc_id = aws_vpc.onprem.id

  tags = merge(local.common_tags, {
    Name = "onprem-igw"
  })
}

resource "aws_route_table" "onprem_public" {
  vpc_id = aws_vpc.onprem.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.onprem.id
  }

  tags = merge(local.common_tags, {
    Name = "onprem-public-rt"
  })
}

resource "aws_route_table_association" "onprem_public" {
  subnet_id      = aws_subnet.onprem_public.id
  route_table_id = aws_route_table.onprem_public.id
}
