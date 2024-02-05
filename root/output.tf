# --------------------------
# Output Blocks
# --------------------------

# Define an output to expose the project name.
output "project_name" {
    value = var.project_name
}

# Define an output to expose the specified AWS region.
output "region_name" {
    value = var.region
}

# Define an output to expose the ID of the created VPC.
output "id_vpc" {
    value = module.vpc_mod.vpc_id
}

# Define an output to expose the ID of the created Internet Gateway.
output "id_igw" {
    value = module.vpc_mod.igw_id
}

# Define an output to expose the ID of the created public subnet in availability zone 1a.
output "public_subnet_1a" {
    value = module.vpc_mod.subnet_id_1a
}

# Define an output to expose the AMI ID used by the created EC2 instance.
output "ami_id" {
    value = module.Ec2_mod.ami_id
}

# Define an output to expose the ID of the created security group.
output "security_group_id" {
    value = module.Securityy_mod.security_group_id
}
