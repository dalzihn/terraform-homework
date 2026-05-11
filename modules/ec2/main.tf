terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.region
  access_key                  = var.access_key
  secret_key                  = var.secret_key

  # Skip validation due to Ministack 
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = var.endpoint_url
  }
}

# Initialize the EC2 instance resource
resource "aws_instance" "my_local_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "My-MiniStack-EC2"
  }
}