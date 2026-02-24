
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

#PRODUCTION VPC

variable "production_vpc_cidr" {
  description = "CIDR block for production VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "production_subnet1_cidr" {
  description = "CIDR block for production private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "production_subnet2_cidr" {
  description = "CIDR block for production private subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "production_subnet3_cidr" {
  description = "CIDR block for production private subnet 3"
  type        = string
  default     = "10.0.3.0/24"
}



#NETWORK VPC

variable "network_vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "network_public_subnet_cidr" {
  type    = string
  default = "10.100.1.0/24"
}

variable "network_private_subnet_cidr" {
  type    = string
  default = "10.100.2.0/24"
}
