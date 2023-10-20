# variable "region" {
#   default = "us-east-1"
# }

# variable "vpc_cidr" {
#   default = "10.0.0.0/16"
# }

# variable "enable_dns_support" {
#   default = "true"
# }

# variable "enable_dns_hostnames" {
#   default = "true"
# }

# variable "preferred_number_of_public_subnets" {
#   type        = number
#   description = "Number of public Subnets"
# }

# variable "preferred_number_of_private_subnets" {
#   type        = number
#   description = "Number of Private Subnets"

# }
# variable "name" {
#   type    = string
#   default = "BB"
# }

# variable "tags" {
#   description = "A mapping to assign all resources."
#   type        = map(string)
#   default     = {}
# }
# variable "environment" {
#   type        = string
#   description = "environment"

# }

# variable "ami" {
#   type        = string
#   description = "AMI ID for the launch template"
# }
# variable "keypair" {
#   type        = string
#   description = "Keypair for Instances"

# }
# variable "account_no" {
#   type        = number
#   description = "MY AWS ACCOUNT NUMBER"
# }

# variable "master-username" {
#   type        = string
#   description = "RDS admin username"

# }
# variable "master-password" {
#   type        = string
#   description = "RDS admin password"

# }
# The security froup for external loadbalancer
variable "public-sg" {
  description = "Security group for external load balancer"
}


# The public subnet froup for external loadbalancer
variable "public-sbn-1" {
  description = "Public subnets to deploy external ALB"
}
variable "public-sbn-2" {
  description = "Public subnets to deploy external  ALB"
}


variable "vpc_id" {
  type        = string
  description = "The vpc ID"
}


variable "private-sg" {
  description = "Security group for Internal Load Balance"
}

variable "private-sbn-1" {
  description = "Private subnets to deploy Internal ALB"
}
variable "private-sbn-2" {
  description = "Private subnets to deploy Internal ALB"
}

variable "ip_address_type" {
  type        = string
  description = "IP address for the ALB"

}

variable "load_balancer_type" {
  type        = string
  description = "te type of Load Balancer"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}


variable "name" {
    type = string
    description = "name of the loadbalancer"
  
}
