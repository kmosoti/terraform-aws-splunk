module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "compute" {
  source = "./modules/compute"

  project_name     = var.project_name
  bastion_ami      = var.bastion_ami
  instance_type    = var.instance_type
  public_subnet_id = module.network.public_subnet_ids[0]
  vpc_id           = module.network.vpc_id
  your_ip          = var.your_ip
  key_pair_name    = var.key_pair_name
}
