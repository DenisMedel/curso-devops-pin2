resource "aws_vpc" "vpc_curso_test" {
  cidr_block           = var.vpc_cidr_curso_test
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Nombre" = "vcp_curso_test"
  }

}

resource "aws_internet_gateway" "igw_curso_test" {
  vpc_id = aws_vpc.vpc_curso_test.id

  tags = {
    "Nombre" = "igw_curso_test"
  }

}

resource "aws_subnet" "sub_public_curso_test" {
  vpc_id = aws_vpc.vpc_curso_test.id
  cidr_block = var.sub_public_curso_test
  map_public_ip_on_launch = true

  tags = {
    "Nombre" = "sub_public_curso_test"
  }

}

resource "aws_route_table" "rt_vpc_curso_test" {
  vpc_id = aws_vpc.vpc_curso_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_curso_test.id
  }

  tags = {
    Name = "rt_vpc_curso_test"
  }

}

resource "aws_route_table_association" "rt_vpc_curso_test_association" {
  subnet_id      = aws_subnet.sub_public_curso_test.id
  route_table_id = aws_route_table.rt_vpc_curso_test.id
}

resource "aws_security_group" "sg_curso_test" {
  name        = "sg_curso_test"
  description = "Permite protocolo ssh y http"
  vpc_id      = aws_vpc.vpc_curso_test.id

  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sg_ingress_curso_test
  }

  ingress {
    description = "Allow inbound SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_ingress_curso_test
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
