provider "aws" {
    region = "eu-west-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

#--------Terraform-Remote-State--------
terraform {
  backend "s3" {
    bucket = "tfstate-hotelmanagement"
    key    = "prod/helm"
    region = "eu-west-1"
    dynamodb_table =  "terraform-lock-prod"
  }
}
