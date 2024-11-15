resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_pair_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-bastion"
  }
}