# --------------------------
# Output Block
# --------------------------

# Define an output to expose the AMI ID used by the created EC2 instance.
output "ami_id" {
  value = aws_instance.Public_Ec2_Instances.ami
}

