module "bastion_host_sg" {
  source = "./bastion_host_sg"

  project_name      = var.project_name
  your_ip = var.your_ip
  vpc_id = var.vpc_id
}

module "salt_master_sg" {
  source = "./salt_master_sg"

  project_name      = var.project_name
  bastion_sg_id = module.bastion_host_sg.bastion_sg_id
  vpc_id = var.vpc_id
}

module "salt_minion_sg" {
  source = "./salt_minion_sg"

  project_name      = var.project_name
  bastion_sg_id = module.bastion_host_sg.bastion_sg_id
  salt_master_sg_id = module.salt_master_sg.salt_master_sg_id
  vpc_id = var.vpc_id
}