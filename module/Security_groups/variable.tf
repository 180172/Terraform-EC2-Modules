# --------------------------
# Variable Definitions
# --------------------------

# Define a variable for a list of port values (numbers) used for dynamic ingress and egress rules.
variable "ports_values" {
    type = list(number)
}

# Define a variable for the protocol used in security group rules.
variable "protocol" {
    type = string
}

# Define a variable for ingress CIDR blocks, which determine the source IP ranges for security group rules.
variable "ingress_cidr" {}

# Define a variable for the VPC ID to associate with security groups.
variable "vpc_id" {
  description = "The ID of the VPC to associate with security groups."
  type        = string
}

# Define a variable for the subnet ID.
variable "subnet_id" {
  description = "The ID of the VPC to associate with security groups."
  type        = string
}
