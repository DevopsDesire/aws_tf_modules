output "name" {
  description = "The name of the IAM user"
  value = try(
    [for u in module.iam_user : u.name],
    [module.iam_user.name]
  )
}

output "arn" {
  description = "The ARN of the IAM user"
  value = try(
    [for u in module.iam_user : u.arn],
    [module.iam_user.arn]
  )
}

output "path" {
  description = "The path of the IAM user"
  value = try(
    [for u in module.iam_user : u.path],
    [module.iam_user.path]
  )
}