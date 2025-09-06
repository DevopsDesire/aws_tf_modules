data "aws_caller_identity" "current" {}

module "iam_group" {
  source = "../../../_modules/iam/iam_group"

  for_each = {
    "support-group"   = { path = "/support/" }
    "developer-group" = { path = "/developer/" }
    "power-group"     = { path = "/power/" }
  }

  group_name = each.key
  path       = each.value.path


  attach_policy = false # if its true then attach the policy arn below
  policy_arns   = flatten([for p in module.aws_iam_policy : p.arn])


  attach_user = true # if its true then attach the user arn below
  user_names = flatten([for u in module.iam_user : u.name])


}



