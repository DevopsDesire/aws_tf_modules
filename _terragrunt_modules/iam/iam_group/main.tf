data "aws_caller_identity" "current" {}


resource "aws_iam_group" "group" {

  for_each = var.group_name
  
  name = "${var.name_prefix}-${each.key}"
  path = each.value.path

}

resource "aws_iam_group_policy_attachment" "policy-attach" {
  for_each = var.attach_policy ? {
    for pair in setproduct(keys(var.group_name), var.policy_arns) :
    "${pair[0]}-${replace(pair[1], "[:/]", "_")}" => {
      group_key  = pair[0]
      policy_arn = pair[1]
    }
  } : {}

  group      = aws_iam_group.group[each.value.group_key].name
  policy_arn = each.value.policy_arn
}



resource "aws_iam_group_membership" "membership" {
  for_each = var.attach_user ? {
    for pair in flatten([
      for group_key in keys(var.group_name) : [
        for user in var.user_names : {
          group = group_key
          user  = user
        }
      ]
    ]) : "${pair.group}-${pair.user}" => pair
  } : {}

  name  = "group-membership-${each.value.group}-${each.value.user}"
  users = [each.value.user]
  group = aws_iam_group.group[each.value.group].name
}