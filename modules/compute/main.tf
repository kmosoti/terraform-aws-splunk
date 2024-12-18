module "bastion_host" {
  source = "./bastion_host"

  project_name      = var.project_name
  bastion_ami       = var.bastion_ami
  instance_type     = var.instance_type
  subnet_id         = var.public_subnet_id
  security_group_id = var.bastion_sg_id
  key_pair_name     = var.key_pair_name
}

module "salt_master" {
  source = "./salt_master"

  project_name      = var.project_name
  salt_ami          = var.bastion_ami
  instance_type     = var.instance_type
  subnet_id         = var.private_subnet_id
  security_group_id = var.salt_master_sg_id
  key_pair_name     = var.key_pair_name
}