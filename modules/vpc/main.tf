terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.region
  access_key                  = var.access_key
  secret_key                  = var.secret_key

  # Skip validation due to Ministack 
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = var.endpoint_url
  }

}

#  VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = { Name = "VPC" }
}

#  Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "IGW" }
}

#  Subnets 
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.az_1a
  map_public_ip_on_launch = true 
  tags                    = { Name = "Public-Subnet-1" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.az_1a
  tags              = { Name = "Private-Subnet-1" }
}

#  NAT Gateway & EIP 
resource "aws_eip" "nat_eip" {
  domain = "vpc" 
  tags   = { Name = "NAT-EIP" }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id 
  tags          = { Name = "NAT-Gateway" }
}

#  Route Tables 
# 1. Route Table cho Public (Đi qua IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id  # 0.0.0/0 đi thẳng qua IGW
  }
}

# 2. Route Table cho Private (Đi qua NAT)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id # 0.0.0/0 đi qua NAT Gateway
  }
}

# 3. Gắn route table vào subnet
resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rta_private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}