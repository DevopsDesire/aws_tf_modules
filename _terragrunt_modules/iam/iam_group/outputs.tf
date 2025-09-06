output "name" {
  description = "The name of the IAM group"
  value       = [ for v in aws_iam_group.group : v.name ]
}

output "path" {
  description = "The path of the IAM group"
  value       = [ for v in aws_iam_group.group : v.path ]
}

output "arn" {
  description = "The ARN of the IAM group"
  value       = [ for v in aws_iam_group.group : v.arn ]
}