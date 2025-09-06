


module "aws_iam_policy" {
  # Path to the reusable IAM module
  source = "../../../_modules/iam_policy"

  for_each = {
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

  policy_name        = "${local.name_prefix}-${each.key}-${each.value.name}"
  policy_path        = each.value.path
  policy_description = each.value.description
  policy_document    = each.value.document
  tags               = local.default_tags
}
