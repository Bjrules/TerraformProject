#################################
## Creating bucket for s3 backend
#################################
resource "aws_s3_bucket" "terraform_state" {
  bucket = "sledge-25"

  # Enable versioning so we can see the full revision history of our state files

  versioning {
    enabled = true
  }
  force_destroy = true

  # Enable server-side encryption by default
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


#Creating VPC
module "VPC" {
  source                              = "./modules/VPC"
  name                                = "VPC-modules"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  enable_classiclink                  = var.enable_classiclink
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

#Module for Application Load balancer, this will create External Load balancer and Internal load balancer

module "ALB" {

  source             = "./modules/ALB"
  vpc_id             = module.VPC.vpc_id
  public-sg          = module.Security.ALB-sg
  private-sg         = module.Security.IALB-sg
  public-sbn-1       = module.VPC.public_subnets-1
  public-sbn-2       = module.VPC.public_subnets-2
  private-sbn-1      = module.VPC.private_subnets-1
  private-sbn-2      = module.VPC.private_subnets-2
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  name               = "ALB-MODULE"

}

module "Security" {
  source = "./modules/Security"
  vpc_id = module.VPC.vpc_id

}

module "AutoScaling" {
  source            = "./modules/Autoscaling"
  ami-web           = var.ami-web
  ami-bastion       = var.ami-bastion
  ami-nginx         = var.ami-nginx
  desired_capacity  = 1
  min_size          = 1
  max_size          = 1
  web-sg            = [module.Security.web-sg]
  bastion-sg        = [module.Security.bastion-sg]
  nginx-sg          = [module.Security.nginx-sg]
  wordpress-alb-tgt = module.ALB.wordpress-tgt
  nginx-alb-tgt     = module.ALB.nginx-tgt
  tooling-alb-tgt   = module.ALB.tooling-tgt
  instance_profile  = module.VPC.instance_profile
  public_subnets    = [module.VPC.public_subnets-1, module.VPC.public_subnets-2]
  private_subnets   = [module.VPC.private_subnets-1, module.VPC.private_subnets-2]
  keypair           = var.keypair

}

# Module for Elastic Filesystem; this module will creat elastic file system isn the webservers availablity
# zone and allow traffic fro the webservers

module "EFS" {
  source       = "./modules/EFS"
  efs-subnet-1 = module.VPC.private_subnets-1
  efs-subnet-2 = module.VPC.private_subnets-2
  efs-sg       = [module.Security.datalayer-sg]
  account_no   = var.account_no
}

# RDS module; this module will create the RDS instance in the private subnet

module "RDS" {
  source          = "./modules/RDS"
  master-password     = var.master-password
  master-username     = var.master-username
  db-sg           = [module.Security.datalayer-sg]
  private_subnets = [module.VPC.private_subnets-3, module.VPC.private_subnets-4]
}

# The Module creates instances for jenkins, sonarqube abd jfrog-Artifactory
module "compute" {
  source          = "./modules/Compute"
  ami-jenkins     = var.ami-bastion
  ami-sonar       = var.ami-sonar
  ami-jfrog       = var.ami-bastion
  subnets-compute = module.VPC.public_subnets-1
  sg-compute      = [module.Security.compute-sg]
  keypair         = var.keypair
}

