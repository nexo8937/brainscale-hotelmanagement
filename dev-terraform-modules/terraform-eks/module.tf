module "eks" {
    source                   = "github.com/nexo8937/terraform-modules//eks"
    app                      = "Hotel-Management"
    #EKS
    cluster_version          = "1.29"
    public_subnets           = data.terraform_remote_state.backend.outputs.public_subnets
    private_subnets          = data.terraform_remote_state.backend.outputs.private_subnets
    #NODEGROUP
    instance_type            = "t3.small"
    desired_size             = "1"
    max_size                 = "2"
    min_size                 = "1"             
    env                      = "dev"
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

#nginx-ingress
module "nginx-controller" {
  source =           "terraform-iaac/nginx-controller/helm"
  additional_set = [
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
      value = "nlb"
      type  = "string"
    },
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
      value = "true"
      type  = "string"
    }
  ]
}


