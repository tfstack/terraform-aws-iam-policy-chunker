# Run the setup_iam module to generate the IAM policy suffix
run "setup_iam" {
  module {
    source = "./tests/setup"
  }
}

# Define the test block to validate IAM policy chunking behavior with random elements
run "iam_policy_chunking_test" {
  variables {
    # Input variables for the IAM policy creation
    resource_list = [
      "arn:aws:iam::aws:role/AWSServiceRoleForAutoScaling",
      "arn:aws:iam::aws:role/AWSServiceRoleForElasticLoadBalancing",
      "arn:aws:iam::aws:role/AWSServiceRoleForECS",
      "arn:aws:iam::aws:role/AWSServiceRoleForEC2Spot",
      "arn:aws:iam::aws:role/AWSServiceRoleForS3AccessPoints",
      "arn:aws:iam::aws:role/AWSServiceRoleForWorkMail",
      "arn:aws:iam::aws:role/AWSServiceRoleForAWSBackup",
      "arn:aws:iam::aws:role/AWSServiceRoleForOrganizations",
      "arn:aws:iam::aws:role/AWSServiceRoleForElasticBeanstalk",
      "arn:aws:iam::aws:role/AWSServiceRoleForFSx",
      "arn:aws:iam::aws:role/AWSServiceRoleForGlue",
      "arn:aws:iam::aws:role/AWSServiceRoleForRDS",
      "arn:aws:iam::aws:role/AWSServiceRoleForElasticSearch",
      "arn:aws:iam::aws:role/AWSServiceRoleForCloudFormationStackSets",
      "arn:aws:iam::aws:role/AWSServiceRoleForIoT",
      "arn:aws:iam::aws:role/AWSServiceRoleForSageMaker",
      "arn:aws:iam::aws:role/AWSServiceRoleForLakeFormation",
      "arn:aws:iam::aws:role/AWSServiceRoleForRedshift",
      "arn:aws:iam::aws:role/AWSServiceRoleForShield",
      "arn:aws:iam::aws:role/AWSServiceRoleForStepFunctions",
      "arn:aws:iam::aws:role/AWSServiceRoleForMacie"
    ]
    chunk_size         = 10
    policy_name        = "example-policy-${run.setup_iam.suffix}"
    policy_description = "A test policy"
    effect             = "Allow"
    actions            = ["sts:AssumeRole"]
  }

  # Assertions to check the number of IAM policies created
  assert {
    condition     = length(aws_iam_policy.policy) == 3
    error_message = "Expected 3 IAM policies to be created, but got a different number."
  }

  # Decode the JSON policy and check that the first policy contains the expected resources
  assert {
    condition     = contains(jsondecode(aws_iam_policy.policy[0].policy).Statement[0].Resource, "arn:aws:iam::aws:role/AWSServiceRoleForAutoScaling")
    error_message = "The first policy chunk doesn't contain the expected resource: AWSServiceRoleForAutoScaling."
  }

  # Check the second policy chunk for specific resources
  assert {
    condition     = contains(jsondecode(aws_iam_policy.policy[1].policy).Statement[0].Resource, "arn:aws:iam::aws:role/AWSServiceRoleForGlue")
    error_message = "The second policy chunk doesn't contain the expected resource: AWSServiceRoleForGlue."
  }

  # Check the third policy chunk for specific resources
  assert {
    condition     = contains(jsondecode(aws_iam_policy.policy[2].policy).Statement[0].Resource, "arn:aws:iam::aws:role/AWSServiceRoleForMacie")
    error_message = "The third policy chunk doesn't contain the expected resource: AWSServiceRoleForMacie."
  }

  # Verify the policy names are correct based on the random suffix
  assert {
    condition     = aws_iam_policy.policy[0].name == "example-policy-${run.setup_iam.suffix}-0"
    error_message = "The first policy chunk does not have the expected name."
  }

  assert {
    condition     = aws_iam_policy.policy[1].name == "example-policy-${run.setup_iam.suffix}-1"
    error_message = "The second policy chunk does not have the expected name."
  }

  assert {
    condition     = aws_iam_policy.policy[2].name == "example-policy-${run.setup_iam.suffix}-2"
    error_message = "The third policy chunk does not have the expected name."
  }
}
