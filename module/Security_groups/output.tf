# --------------------------
# Output Block
# --------------------------

# Define an output to expose the ID of the created AWS security group.
output "security_group_id" {
  value=aws_security_group.public_security_group.id
}


