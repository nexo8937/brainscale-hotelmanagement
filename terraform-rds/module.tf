#Database Module
module "rds" {
    source                             = "github.com/nexo8937/terraform-modules//rds"
    vpc                                = data.terraform_remote_state.backend.outputs.vpc
    db-subnets                         = data.terraform_remote_state.backend.outputs.db_subnets
    db-name                            = "bluebirdhotel"
    username                           = "exo"
    password                           = "exoexoexo"
    instance-class                     = "db.t3.micro"
    allocated-storage                  = "200"
    engine                             = "mysql"
    app                                = "Brain-Scale"
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

