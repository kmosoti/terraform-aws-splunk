module "security_groups" {
  source = "./security_groups"

  project_name = var.project_name
  vpc_id       = var.vpc_id
  your_ip      = var.your_ip
}

module "bastion_host" {
  source = "./bastion_host"

  project_name      = var.project_name
  bastion_ami       = var.bastion_ami
  instance_type     = var.instance_type
  subnet_id         = var.public_subnet_id
  security_group_id = module.security_groups.bastion_sg_id
  key_pair_name     = var.key_pair_name
}
