output "name" {
  description = "The name of the IAM group"
  value       = aws_iam_group.group.name
}

output "path" {
  description = "The path of the IAM group"
  value       = aws_iam_group.group.path
}

output "arn" {
  description = "The ARN of the IAM group"
  value       = aws_iam_group.group.arn
}