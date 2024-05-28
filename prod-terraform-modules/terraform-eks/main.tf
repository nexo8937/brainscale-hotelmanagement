#--------Provider--------
provider "aws" {
    region = "eu-west-1"
}


#--------Terraform-Remote-State--------
terraform {
  backend "s3" {
    bucket = "tfstate-hotelmanagement"
    key    = "prod/eks"
    region = "eu-west-1"
    dynamodb_table =  "terraform-lock-prod"
  }
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
