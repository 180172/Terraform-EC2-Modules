# --------------------------
# Module Instances
# --------------------------

# Instantiate the VPC module to create a Virtual Private Cloud (VPC).
module "vpc_mod" {
    source          = "../module/VPC"
    project_name    = var.project_name
    pub_sub_1a_cidr = var.pub_sub_1a_cidr
    pub_sub_1b_cidr = var.pub_sub_1b_cidr
    cidr_blocks     = var.cidr_blocks
}

# Instantiate the Security Groups module to create necessary security groups.
module "Securityy_mod" {
    source       = "../module/Security_groups"
    vpc_id       = module.vpc_mod.vpc_id
    subnet_id    = module.vpc_mod.subnet_id_1a
    ports_values = var.ports_values
    ingress_cidr = var.ingress_cidr
    protocol     = var.protocol
}

# Instantiate the EC2 module to create an Elastic Compute Cloud (EC2) instance.
module "Ec2_mod" {
    source            = "../module/EC2"
    instance_typ      = var.instance_typ
    vpc_id            = module.vpc_mod.vpc_id
    subnet_id         = module.vpc_mod.subnet_id_1a
    security_group_id = module.Securityy_mod.security_group_id
    depends_on        = [module.Securityy_mod]
}
