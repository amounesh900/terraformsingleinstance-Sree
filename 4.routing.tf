resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}


#Public Subnet Routing Assosiation
resource "aws_route_table_association" "terraform-public" {
    count = 3 # 0 1 2
    subnet_id = element(aws_subnet.public-subnets.*.id, count.index)
    route_table_id = aws_route_table.terraform-public.id
}

#Private Subnet Routing Assosiation
resource "aws_route_table_association" "terraform-private" {
    count = 3 # 0 1 2
    subnet_id = element(aws_subnet.private-subnets.*.id, count.index)
    route_table_id = aws_route_table.terraform-private.id
}