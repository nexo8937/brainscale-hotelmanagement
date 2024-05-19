#--------Provider--------

provider "aws" {
  region = "eu-west-1"
}


#--------Terraform-Remote-State--------
terraform {
  backend "s3" {
    bucket = "tfstate-hotelmanagement"
    key    = "network"
    region = "eu-west-1"
    dynamodb_table =  "terraform-lock"
  }
}
