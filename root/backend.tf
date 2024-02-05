
terraform {
  backend "s3" {
    bucket = "<Bucket-Name>"
    key = "terraform_state_file/terraform.tfstate"
    region = "<Bucket-Region>"
    dynamodb_table = "<Dynamo-DB-Table-Name>"
  }
}
