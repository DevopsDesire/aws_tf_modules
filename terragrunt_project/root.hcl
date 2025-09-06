locals {
  environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env_name            = local.environment_vars.locals.environment
  region              = local.environment_vars.locals.region
  aws_access_key      = local.environment_vars.locals.aws_access_key
  aws_secret_key      = local.environment_vars.locals.aws_secret_key
  aws_tf_state_bucket = local.environment_vars.locals.aws_tf_state_bucket

}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
      terraform {
        required_providers {
          aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
          }
        }
      }

      provider "aws" {
        region = "${local.region}"
          access_key = "${local.aws_access_key}"
          secret_key = "${local.aws_secret_key}"
      }
      EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket  = local.aws_tf_state_bucket
    key     = "${local.env_name}/${path_relative_to_include()}/terraform.tfstate"
    region  = local.region
    encrypt = true
    #dynamodb_table = "my-terraform-lock-table"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

} 