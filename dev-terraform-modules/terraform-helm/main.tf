#--------Provider--------
provider "aws" {
    region = "eu-west-1"
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.eks.outputs.cluster_name]
      command     = "aws"
    }
  }
}

#--------Terraform-Remote-State--------
terraform {
  backend "s3" {
    bucket = "tfstate-hotelmanagement"
    key    = "dev/helm"
    region = "eu-west-1"
    dynamodb_table =  "terraform-lock-dev"
  }
}

#--------remote-state-data------------
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "tfstate-hotelmanagement"
    key    = "dev/eks"
    region = "eu-west-1"
  }
}
