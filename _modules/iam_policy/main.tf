data "aws_caller_identity" "current" {}


resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description
  
  policy      = var.policy_document

  tags = merge(var.tags, {
    created_on  = timestamp()
    created_by  = data.aws_caller_identity.current.arn
    modified_by = data.aws_caller_identity.current.arn

  })

  lifecycle {
    ignore_changes = [tags["created_on"], tags["created_by"]]
  }


}