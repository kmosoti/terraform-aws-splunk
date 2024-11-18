resource "aws_instance" "salt_master" {
  ami                    = var.salt_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_pair_name

  associate_public_ip_address = false

  user_data = file("${path.module}/salt_master_bootstrap_install.sh")

  tags = {
    Name = "${var.project_name}-salt-master"
  }
}