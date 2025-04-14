resource "aws_instance" "public-servers" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "${var.vpc_name}-Server-1"
    Env   = var.environment
    Owner = var.owner
  }
  # root disk 
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    encrypted             = "true"
    delete_on_termination = "true"
  }
}
