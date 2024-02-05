# VPC Block

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_blocks
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  enable_dns_support =  true

  tags = {
    Name = "${var.project_name}-VPC"
  }
}

# Data source block for availability zones
data "aws_availability_zones" "available_zones" {}

# Public Subnets Block 1A
resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name =  "public_subnet_1a"
  }
}

# Public Subnet Block 1B
resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name =  "public_subnet_1b"
  }
}

# Internet Gate Way for Public
resource "aws_internet_gateway" "internet_gateway_pub" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name}-IGW"
  }
}

# Route Tbles for Public Subnet's
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_pub.id
  }

  tags = {
    Name = "Public-Route_table"
  }
}

# associate public subnet pub-sub-1a to public route table

resource "aws_route_table_association" "pub-sub-1a_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_1a.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to public route table
resource "aws_route_table_association" "pub-sub-2-b_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_1b.id
  route_table_id      = aws_route_table.public_route_table.id
}