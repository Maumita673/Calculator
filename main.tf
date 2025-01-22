resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-west-2a"
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route_table" "demo_rtb" {
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.demo_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demo_igw.id
}

resource "aws_route_table_association" "demo_rta" {
  subnet_id      = aws_subnet.demo_subnet.id
  route_table_id = aws_route_table.demo_rtb.id
}

resource "aws_instance" "demo_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo_subnet.id

  tags = {
    Name = "DemoInstance"
  }
}

resource "aws_s3_bucket" "demo_bucket_aws" {
  bucket = var.bucket_name
  acl    = "private"
}
