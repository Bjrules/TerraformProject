region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "Dev"

tags = {
  Owner-Email     = "ken2klass4real@gmail.com"
  Managed-By      = "Terraform"
  Billing_Account = "78934728914"
}
account_no = 941866453236

master-username = "admin"

master-password = "adminBanjo"

ami     = "ami-053b0d53c279acc90"

keypair = "terra"

#End of tfvars file 