# --- VPC Outputs ---
output "vpc_id" {
  description = "ID of VPC to associate with other resources (e.g., Subnets, IGW, NAT Gateway)"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

# --- Subnet Outputs ---
output "public_subnet_id" {
  description = "ID of Public Subnet 1 (Used for Web Server/Bastion Host)"
  value       = aws_subnet.public_subnet.id
}


output "private_subnet_id" {
  description = "ID of Private Subnet 1 (Used for App/DB Server)"
  value       = aws_subnet.private_subnet.id
}


# --- NAT Gateway Outputs ---
output "nat_gateway_ip" {
  description = "Static IP of NAT Gateway (Used for whitelisting if needed)"
  value       = aws_eip.nat_eip.public_ip
}

# --- Internet Gateway Outputs ---
output "igw_id" {
  description = "ID of Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
