#Database Module
module "rds" {
    source                             = "github.com/nexo8937/terraform-modules//rds"
    vpc                                = data.terraform_remote_state.backend.outputs.vpc
    db-subnets                         = data.terraform_remote_state.backend.outputs.db_subnets
    db-subnets-group-name              = "db subnet group dev"
    db-name                            = "bluebirdhotel"
    username                           = "Admin"
    password                           = "12345678"
    instance-class                     = "db.t3.micro"
    allocated-storage                  = "200"
    engine                             = "mysql"
    app                                = "Hotel-Management"
    env                                = "dev"
}



#remote-state-data
data "terraform_remote_state" "backend" {
  backend = "s3"
  config = {
    bucket = "tfstate-hotelmanagement"
    key    = "dev/network"
    region = "eu-west-1"
  }
}

