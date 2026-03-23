resource "aws_vpc" "production" {
  cidr_block = "192.168.0.0/16"

  tags = merge(local.common_tags, {
    Name = "production-vpc"
  })
}

resource "aws_subnet" "production_public" {
  vpc_id                  = aws_vpc.production.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "production-public-subnet"
  })
}

resource "aws_internet_gateway" "production" {
  vpc_id = aws_vpc.production.id

  tags = merge(local.common_tags, {
    Name = "production-igw"
  })
}

resource "aws_route_table" "production_public" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production.id
  }

  tags = merge(local.common_tags, {
    Name = "production-public-rt"
  })
}

resource "aws_route_table_association" "production_public" {
  subnet_id      = aws_subnet.production_public.id
  route_table_id = aws_route_table.production_public.id
}
