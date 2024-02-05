# --------------------------
# Variable Definitions
# --------------------------

# Define a variable for the EC2 instance type with a default value of "t2.micro."
variable "instance_typ" {
  default = "t2.micro"
}

# Define a variable for the VPC ID to associate with security groups.
variable "vpc_id" {
  description = "The ID of the VPC to associate with security groups."
  type        = string
  default = "false"
}

# Define a variable for the VPC security group IDs.
variable "vpc_security_group_ids" {
  description = "The ID of the VPC to associate with security groups."
  type        = string
  default = "false"
}

# Define a variable for the subnet ID.
variable "subnet_id" {
  default = "false"
}

# Define a variable for the security group ID with a specified type.
variable "security_group_id" {
  default = "false"
  type = string
}



