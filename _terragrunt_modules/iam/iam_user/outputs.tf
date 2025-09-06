output "names" {
  description = "The name of the IAM user"
  value       = [ for v in aws_iam_user.main : v.name ]

}

output "arn" {
  description = "The ARN of the IAM user"
  value       = [ for v in aws_iam_user.main : v.arn ]
}


