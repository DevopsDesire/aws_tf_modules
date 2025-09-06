include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../_terragrunt_modules/iam/iam_policy"
}



locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  name_prefix      = local.environment_vars.locals.name_prefix
  default_tags     = local.environment_vars.locals.default_tags


}

inputs = {


  policy_name = {
    "s3-readonly-policy" = {
      name        = "s3-readonly-policy"
      path        = "/demo_policies/"
      description = "Read-only access to S3 buckets"
      document = jsonencode(
        {
          Version = "2012-10-17"
          Statement = [
            {
              Effect = "Allow"
              Action = [
                "s3:Get*",
                "s3:List*"
              ]
              Resource = "*"
            }
          ]
        }
      )
    }
    "ec2-fullaccess-policy" = {
      name        = "ec2-fullaccess-policy"
      path        = "/demo_policies/"
      description = "Full access to EC2 resources"
      document = jsonencode(
        {
          Version = "2012-10-17"
          Statement = [
            {
              Effect   = "Allow"
              Action   = "ec2:*"
              Resource = "*"
            }
          ]
      })
    }
  }

  name_prefix   = local.name_prefix
  force_destroy = true
  tags          = local.environment_vars.locals.default_tags

  tags = local.default_tags

}