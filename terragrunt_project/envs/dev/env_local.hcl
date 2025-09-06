locals {

  environment = "dev"
  region      = "ap-south-1"
  project     = "yug"
  application = "wet"

  aws_tf_state_bucket = "dyg-terraform-state"
  #aws_access_key      = "your-access-key"
  #aws_secret_key      = "your-secret-key"

  name_prefix = "${local.project}-${local.environment}-${local.application}"


  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
    Project     = "yug"
    Application = "wet"
    Owner       = "devops"
    Team        = "team"
  }

}
