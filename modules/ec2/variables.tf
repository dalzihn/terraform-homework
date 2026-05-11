variable "region" {
  description = "The AWS region to deploy the EC2 instance"
  type        = string
  default     = "us-east-1"
}

### EC2 variable
variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-000000000001" 
}


variable "access_key" {
  description = "AWS Access Key for LocalStack"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key for LocalStack"
  type        = string
}

variable "endpoint_url" {
  description = "The endpoint URL for LocalStack"
  type        = string
  default     = "http://localhost:4566"
}