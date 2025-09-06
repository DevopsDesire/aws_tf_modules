output "iam_user_name" {
  description = "The name of the IAM user"
  value = try(
    [for u in module.iam_user : u.name],
    [module.iam_user.name]
  )
}

output "iam_user_arn" {
  description = "The ARN of the IAM user"
  value = try(
    [for u in module.iam_user : u.arn],
    [module.iam_user.arn]
  )
}
