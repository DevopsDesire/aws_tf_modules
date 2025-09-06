data "aws_caller_identity" "current" {}


resource "aws_iam_policy" "policy" {
  for_each    = var.policy_name
  name        = "${var.name_prefix}-${each.key}-${var.resource_type}"
  path        = each.value.path
  description = each.value.description

  policy = each.value.document

  tags = merge(var.tags, {
    created_on  = timestamp()
    created_by  = data.aws_caller_identity.current.arn
    modified_by = data.aws_caller_identity.current.arn

  })

  lifecycle {
    ignore_changes = [tags["created_on"], tags["created_by"]]
  }


}