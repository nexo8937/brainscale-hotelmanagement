module "application" {
  source           = "github.com/nexo8937/terraform-modules//helm"
  container_name   = "brain-scale"
  container_image  = "548844171305.dkr.ecr.eu-west-1.amazonaws.com/hotel-management-prod:latest"
  replica_count    = 2
  release_name     = "hotel-management"
  helm_chart_path  = "../../helm"
  values_file_path = "../../helm/values.yaml"
}
