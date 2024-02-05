
terraform {
  backend "s3" {
    bucket = "s3-buck-terraform"
    key = "terraform_state_file/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Terraform-Dynamo-DB"
  }
}
