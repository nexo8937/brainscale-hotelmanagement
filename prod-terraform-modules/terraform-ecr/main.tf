#--------Provider--------

provider "aws" {
  region = "eu-west-1"
}


#--------Terraform-Remote-State--------
terraform {
  backend "s3" {
    bucket = "tfstate-hotelmanagement"
    key    = "prod/ecr"
    region = "eu-west-1"
    dynamodb_table =  "terraform-lock-prod"
  }
}
