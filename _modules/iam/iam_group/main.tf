
data "aws_caller_identity" "current" {}


resource "aws_iam_group" "group" {
  name = var.group_name
  path = var.path

}

resource "aws_iam_group_policy_attachment" "policy-attach" {

  for_each = var.attach_policy ? toset(var.policy_arns) : toset([])


  group      = aws_iam_group.group.name
  policy_arn = each.value
}



resource "aws_iam_group_membership" "membership" {

  for_each = var.attach_user ? toset(var.user_names) : toset([])

  name  = "group-membership"
  users = [each.value]
  group = aws_iam_group.group.name
}