# --------------------------
# AWS Security Group Resource
# --------------------------

# Create an AWS security group for the public instance with specified configurations.
resource "aws_security_group" "public_security_group" {
  name = "Public_Instance_Security_Group"
  description = "Public_Instance_Security_Group"
  vpc_id = var.vpc_id

  # Dynamic Ingress Rules Configuration
  dynamic "ingress" {
    for_each = var.ports_values

    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = var.protocol
        cidr_blocks = var.ingress_cidr
    }
  }
  # Dynamic Egress Rules Configuration
  dynamic "egress" {
    for_each = var.ports_values 

    content {
        from_port = egress.value
        to_port = egress.value
        protocol = var.protocol
        cidr_blocks = var.ingress_cidr
    }
  }

  
}
