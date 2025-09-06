output "name" {
  description = "The name of the IAM policy"
  value       = [ for v in aws_iam_policy.policy :  v.name ]
}

output "arns" {
  description = "The ARNs of the IAM policies"
  value       = [ for v in aws_iam_policy.policy :  v.arn ]
}


