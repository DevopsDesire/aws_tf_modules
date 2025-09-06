
data "aws_caller_identity" "current" {}

resource "aws_iam_user" "main" {
  for_each      = var.iam_name
  name          = "${var.name_prefix}-${each.key}-${var.resource_type}"
  path          = each.value
  force_destroy = var.force_destroy

  tags = merge(var.tags, {
    created_on  = timestamp()
    created_by  = data.aws_caller_identity.current.arn
    modified_by = data.aws_caller_identity.current.arn

  })

  lifecycle {
    ignore_changes = [tags["created_on"], tags["created_by"]]
  }
}
