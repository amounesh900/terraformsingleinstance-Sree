variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "key_name" {}
variable "azs" {}
variable "public_subnets_cidr" {}
variable "private_subnets_cidr" {}
variable "environment" {}
variable "owner" {}
variable "imagename" {}
variable "instance_type" {
  default = {
    dev  = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
  }
}

