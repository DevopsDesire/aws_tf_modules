output "name" {
    description = "The name of the IAM policy"
    value       = aws_iam_policy.policy.name
}

output "arn" {
    description = "The ARN of the IAM policy"
    value       = aws_iam_policy.policy.arn
}

output "id" {
    description = "The ID of the IAM policy"
    value       = aws_iam_policy.policy.id
}

output "path" {
    description = "The path of the IAM policy"
    value       = aws_iam_policy.policy.path
}

output "policy" {
    description = "The policy document"
    value       = aws_iam_policy.policy.policy
}



