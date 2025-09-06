include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../_terragrunt_modules/iam/iam_group"
}


dependency "aws_iam_policy" {
  config_path = "../policy"
}

dependency "iam_user" {
  config_path = "../user"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  name_prefix      = local.environment_vars.locals.name_prefix


}

inputs = {


  # example of map variable....  iam_name = path of user
  group_name = {
    "support-group"   = { path = "/support/" }
    "developer-group" = { path = "/developer/" }
    "power-group"     = { path = "/power/" }
  }

  name_prefix   = local.name_prefix

  attach_policy = true # if its true then attach the policy arn below
  policy_arns   = dependency.aws_iam_policy.outputs.arns


  attach_user = true # if its true then attach the user arn below
  user_names  = dependency.iam_user.outputs.names

  tags          = local.environment_vars.locals.default_tags

}