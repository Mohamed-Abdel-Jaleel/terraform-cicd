terraform {
    backend "s3" {
        region = "us-east-1"
        key = "statefile"
        bucket = "terraform-bucket-try"
    }
} 

resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.cidr_block_vpc.cidr_block
  tags = {
    "Name" = var.cidr_block_vpc.name
  }
}

resource "aws_subnet" "terraform-subnet-1" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.cidr_block_subnet_1.cidr_block
  availability_zone = var.availability_zone
  tags = {
    "Name" = var.cidr_block_subnet_1.name
  }
}

resource "aws_subnet" "terraform-subnet-2" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.cidr_block_subnet_2.cidr_block
  availability_zone = var.availability_zone
  tags = {
    "Name" = var.cidr_block_subnet_2.name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    "Name" = "terraform-igw"
  }
}

resource "aws_route" "terraform-route" {
  route_table_id         = aws_vpc.terraform-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_security_group" "terraform-security-group" {
  name   = "terraform-security-group"
  vpc_id = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    "Name" = "terraform-security-group"
  }
}

