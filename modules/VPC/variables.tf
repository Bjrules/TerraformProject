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


variable "region" {
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_classiclink" {
  type = bool
}


variable "preferred_number_of_public_subnets" {
  type = number
}

variable "preferred_number_of_private_subnets" {
  type = number
}

variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
}

variable "public_subnets" {
  type        = list(any)
  description = "list of public subnets"

}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  type    = string
  default = "BB"

}
variable "environment" {
  default = "true"
}


