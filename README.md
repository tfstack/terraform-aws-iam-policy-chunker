# terraform-aws-iam-policy-chunker

This module creates multiple IAM policies, each containing up to 10 policy statements, and optionally attaches them to an IAM role, user, or group.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.29 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions"></a> [actions](#input\_actions) | Actions for the IAM policy | `list(string)` | n/a | yes |
| <a name="input_chunk_size"></a> [chunk\_size](#input\_chunk\_size) | Number of resources per policy chunk | `number` | `10` | no |
| <a name="input_effect"></a> [effect](#input\_effect) | Effect for the IAM policy (Allow or Deny) | `string` | `"Allow"` | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | Description for the policy | `string` | `null` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Base name for the policy | `string` | n/a | yes |
| <a name="input_resource_list"></a> [resource\_list](#input\_resource\_list) | List of resources for the IAM policy | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_names"></a> [policy\_names](#output\_policy\_names) | List of created IAM policy names |
