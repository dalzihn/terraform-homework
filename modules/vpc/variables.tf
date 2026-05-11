variable "access_key" {
    description = "AWS Access Key"
    type        = string
} 

variable "secret_key" {
    description = "AWS Secret Key"
    type        = string
}

variable "region" {
    description = "AWS Region"
    type        = string
    default     = "us-east-1"
}

variable "endpoint_url" {
  description = "The endpoint URL for LocalStack"
  type        = string
  default     = "http://localhost:4566"
}

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

