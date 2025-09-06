include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../_terragrunt_modules/iam/iam_user"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  name_prefix      = local.environment_vars.locals.name_prefix


}

inputs = {


  # example of map variable....  iam_name = path of user
  iam_name = {
    "support-user"   = "/support/",
    "developer-user" = "/developer/",
    "power-user"     = "/power/"
  }

  name_prefix   = local.name_prefix
  force_destroy = true
  tags          = local.environment_vars.locals.default_tags

}