resource "aws_subnet" "public-subnets" {
    count = 3 # 0 1 2
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.public_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "${var.vpc_name}-Public-Subnet-${count.index}"
    }
}

resource "aws_subnet" "private-subnets" {
    count = 3 # 0 1 2
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.private_subnets_cidr, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "${var.vpc_name}-Private-Subnet-${count.index}"
    }
}