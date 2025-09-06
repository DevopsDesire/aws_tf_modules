output "iam_policy_name" {
  value = try(
    [for p in module.aws_iam_policy : p.name],
    [module.aws_iam_policy.name]
  )
}

output "iam_policy_arn" {
  value = try(
    [for p in module.aws_iam_policy : p.arn],
    [module.aws_iam_policy.arn]
  )
}
