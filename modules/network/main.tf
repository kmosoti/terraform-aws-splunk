module "main_vpc" {
  source = "./vpc"

  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
}

module "security_groups" {
  source = "./security_groups/"

  project_name = var.project_name
  your_ip = var.your_ip
  vpc_id = module.main_vpc.vpc_id
}