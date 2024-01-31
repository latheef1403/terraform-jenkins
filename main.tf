resource "aws_vpc" "myvpc1" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet01" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "subnet02" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
}

resource "aws_internet_gateway" "igw001" {
  vpc_id = aws_vpc.myvpc1.id
}

resource "aws_route_table" "route01" {
  vpc_id = aws_vpc.myvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw001.id
  }
}

resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.route01.id
}

resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.route01.id
}

resource "aws_security_group" "webSg1" {
  name   = "web"
  vpc_id = aws_vpc.myvpc1.id
}
