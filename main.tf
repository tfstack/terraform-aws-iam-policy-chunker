resource "aws_iam_policy" "policy" {
  count = ceil(length(var.resource_list) / var.chunk_size)

  name        = "${var.policy_name}-${count.index}"
  description = var.policy_description != null ? "${var.policy_description} - chunk ${count.index}" : "Policy chunk ${count.index}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = var.effect
        Action = var.actions
        Resource = slice(
          var.resource_list,
          count.index * var.chunk_size,
          min((count.index + 1) * var.chunk_size, length(var.resource_list))
        )
      }
    ]
  })
}
