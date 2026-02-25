

resource "aws_vpc" "production_vpc" {
  cidr_block           = var.production_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "production-vpc"
  }
}


# Public Subnet 1


resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.production_subnet1_cidr
  

  tags = {
    Name = "production-public-subnet-1"
  }
}

# Private Subnet 2

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.production_subnet2_cidr

  tags = {
    Name = "production-private-subnet-2"
  }
}

# Private Subnet 3


resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.production_subnet3_cidr
 

  tags = {
    Name = "production-private-subnet-3"
  }
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {
    Name = "production-igw"
  }
}

# ELASTIC IP FOR NAT

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


# NAT GATEWAY (Placed in Public Subnet)

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "production-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
# Public Route Table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.production_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "production-public-rt"
  }
}
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Route Table

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.production_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "production-private-rt"
  }
}

# Route Table Associations



resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}



