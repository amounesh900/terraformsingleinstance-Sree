output "vpc_id" {
  value = aws_vpc.default.id
}

output "vpc_arn" {
  value = aws_vpc.default.arn
}

output "public_subnet_ids" {
  value = aws_subnet.public-subnets.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private-subnets.*.id
}
