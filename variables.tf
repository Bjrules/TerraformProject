variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_classiclink" {
  type = bool
}
###########################################################################################
variable "ami-bastion" {
  type        = string
  description = "ami for bastion"
}

variable "ami-web" {
  type        = string
  description = "ami for webservers"
}

variable "ami-nginx" {
  type        = string
  description = "ami for nginx"
}
variable "ami-sonar" {
    type = string
    description = "ami for sonar"
}
##########################################################################################

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public Subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of Private Subnets"

}
variable "name" {
  type    = string
  default = "BB"
}

variable "tags" {
  description = "A mapping to assign all resources."
  type        = map(string)
  default     = {}
}
variable "environment" {
  type        = string
  description = "environment"

}

variable "ami" {
  type        = string
  description = "AMI ID for the launch template"
}
variable "keypair" {
  type        = string
  description = "Keypair for Instances"

}
variable "account_no" {
  type        = number
  description = "MY AWS ACCOUNT NUMBER"
}

variable "master-username" {
  type        = string
  description = "RDS admin username"

}
variable "master-password" {
  type        = string
  description = "RDS admin password"

}
