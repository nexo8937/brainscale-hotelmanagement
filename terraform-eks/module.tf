module "eks" {
    source                   = "github.com/nexo8937/terraform-modules//eks"
    app                      = "Brain-Scale"
    cluster_version          = "1.29"
    public_subnets          = data.terraform_remote_state.backend.outputs.public_subnets
    private_subnets          = data.terraform_remote_state.backend.outputs.private_subnets
}

#remote-state-data
data "terraform_remote_state" "backend" {
  backend = "s3"
  config = {
    bucket = "tfstate-hotelmanagement"
    key    = "network"
    region = "eu-west-1"
  }
}
