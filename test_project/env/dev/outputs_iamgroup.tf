output "iam_group_name" {
  value = try(
    [for g in module.iam_group : g.name],
    [module.iam_group.name]
  )
}

output "iam_group_arn" {
  value = try(
    [for g in module.iam_group : g.arn],
    [module.iam_group.arn]
  )
}
