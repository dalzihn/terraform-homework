variable "cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
    default     = ""
}

variable "public_subnet_cidr_block" {
    description = "CIDR block for the public subnet"
    type        = string
    default     = ""
}

variable "private_subnet_cidr_block" {
    description = "CIDR block for the private subnet"
    type        = string
    default     = ""
}

variable "az_1a" {
    description = "Availability Zone for the subnets"
    type        = string
    default     = ""
}