module "VPC" {
  source = "./modules/VPC"
  region = var.region
  vpc_cidr = var.vpc_cidr
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  preferred_number_of_public_subnets = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets = [for i in rage(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  publict_subnets = [for i range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}