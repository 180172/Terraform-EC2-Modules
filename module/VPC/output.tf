# --------------------------
# Output Blocks
# --------------------------

# Define an output to expose the ID of the created VPC.
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Define an output to expose the ID of the created Internet Gateway.
output "igw_id" {
  value = aws_internet_gateway.internet_gateway_pub.id
}

# Define an output to expose the ID of the created subnet in availability zone 1a.
output "subnet_id_1a" {
  value = aws_subnet.public_subnet_1a.id  
}

# Define an output to expose the ID of the created subnet in availability zone 1b.
output "subnet_id_1b" {
  value = aws_subnet.public_subnet_1b.id
}
