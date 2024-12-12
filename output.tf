output "policy_names" {
  description = "List of created IAM policy names"
  value       = [for p in aws_iam_policy.policy : p.name]
}
