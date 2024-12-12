variable "resource_list" {
  description = "List of resources for the IAM policy"
  type        = list(string)
}

variable "actions" {
  description = "Actions for the IAM policy"
  type        = list(string)
}

variable "effect" {
  description = "Effect for the IAM policy (Allow or Deny)"
  type        = string
  default     = "Allow"
}

variable "policy_name" {
  description = "Base name for the policy"
  type        = string
}

variable "policy_description" {
  description = "Description for the policy"
  type        = string
  default     = null
}

variable "chunk_size" {
  description = "Number of resources per policy chunk"
  type        = number
  default     = 10
}
