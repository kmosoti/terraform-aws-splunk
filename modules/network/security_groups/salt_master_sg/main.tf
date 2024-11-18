resource "aws_security_group" "salt_master_sg" {
  name        = "${var.project_name}-salt-master-sg"
  description = "Security group for Salt Master"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-salt-master"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_bastion" {
  security_group_id             = aws_security_group.salt_master_sg.id
  referenced_security_group_id  = var.bastion_sg_id
  from_port                     = 22
  ip_protocol                   = "tcp"
  to_port                       = 22
}

resource "aws_vpc_security_group_ingress_rule" "salt_Request_reply_port" {
  security_group_id = aws_security_group.salt_master_sg.id
  referenced_security_group_id = var.bastion_sg_id
  from_port         = 4506
  ip_protocol       = "tcp"
  to_port           = 4506
}

resource "aws_vpc_security_group_ingress_rule" "salt_minion_pub_port" {
  security_group_id = aws_security_group.salt_master_sg.id
  referenced_security_group_id         = var.bastion_sg_id
  from_port         = 4505
  ip_protocol       = "tcp"
  to_port           = 4505
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.salt_master_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}