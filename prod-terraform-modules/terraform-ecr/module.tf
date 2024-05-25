module "ecr" {
    source                = "github.com/nexo8937/terraform-modules//ecr"
    app                   = "Hotel-Management"
    env                   = "prod"
    ecr_repo_name         = "hotel-management-prod"
}
