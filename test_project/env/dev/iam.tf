locals {
  resource_type = "iam"
}


module "iam_user" {
  # Path to the reusable IAM module
  source = "../../../_modules/iam/iam_user"

  for_each = {
    "support-user"   = { path = "/demo_users/" }
    "developer-user" = { path = "/demo_users/" }
    "power-user"     = { path = "/demo_users/" }
  }

  # Use the key as the IAM username
  name = "${local.name_prefix}-${each.key}-${local.resource_type}"

  # Use the path defined in the value map
  path = each.value.path

  force_destroy = true

  tags = local.default_tags

}
