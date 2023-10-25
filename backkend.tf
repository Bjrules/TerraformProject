terraform {
  backend "s3" {
    bucket         = "sledge-25"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# terraform {
#   cloud {
#     organization = "pisitis"

#     workspaces {
#       name = "terraform-aws-cloud"
#     }
#   }
# }