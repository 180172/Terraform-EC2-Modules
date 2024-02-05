# --------------------------
# AWS AMI Data Source
# --------------------------

# Define a data source to fetch information about the latest Amazon Linux AMI.
data "aws_ami" "amazon_linux_ami" {
    most_recent = true
    owners = ["amazon"]
    
    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]

    }
}

# --------------------------
# AWS EC2 Instance Resource
# --------------------------

# Create an AWS EC2 instance with a specified configuration.
resource "aws_instance" "Public_Ec2_Instances" {
  ami = data.aws_ami.amazon_linux_ami.id
  instance_type = var.instance_typ
  key_name = "Nginx_1"
  subnet_id       = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  # SSH Connection Configuration
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file(".<PEM-KEY-NAME>")
    host        = self.public_ip
  }
  
  # EC2 Instance Tags
  tags = {
    Name = "Public_Sunet_Server-1"
  }

   # File Provisioning
  provisioner "file" {
    source = "./<.PEM Key>"
    destination = "<Path-Where-You-Want-To-Store-.PEM-Key>"
  }

  # Remote Execution Provisioning
  provisioner "remote-exec" {
    inline = [ 
      "sudo chmod 700 <.PEM-KEY>"
     ]
  }

}
