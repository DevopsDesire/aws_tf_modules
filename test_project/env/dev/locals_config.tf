locals {
    environment = "dev"
    region      = "us-east-1"
    project     = "dyg"
    application = "wet"
    owner       = "devopsyug"
    team        = "devops"

    name_prefix = "${local.project}-${local.application}-${local.environment}"


    default_tags = {
        ManagedBy   = "Terraform"
        Environment = local.environment
        Project     = local.project
        Application = local.application
        Owner       = local.owner
        Team        = local.team
    }
}