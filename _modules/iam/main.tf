
data "aws_caller_identity" "current" {}

resource "aws_iam_user" "main" {
  name          = var.name
  path          = var.path
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
