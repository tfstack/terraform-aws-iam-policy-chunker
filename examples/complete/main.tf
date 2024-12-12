module "iam_policy_chunker" {
  source = "../.."
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
    "arn:aws:iam::aws:role/AWSServiceRoleForMacie",
    "arn:aws:iam::aws:role/AWSServiceRoleForDynamoDBReplication",
    "arn:aws:iam::aws:role/AWSServiceRoleForGameLift",
    "arn:aws:iam::aws:role/AWSServiceRoleForCloudTrail",
    "arn:aws:iam::aws:role/AWSServiceRoleForCloudFront",
    "arn:aws:iam::aws:role/AWSServiceRoleForMediaLive",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTAnalytics",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTDeviceAdvisor",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTFleetHub",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTEvents",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTWireless",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTThingsGraph",
    "arn:aws:iam::aws:role/AWSServiceRoleForIoTSiteWise",
    "arn:aws:iam::aws:role/AWSServiceRoleForEventBridgeScheduler",
    "arn:aws:iam::aws:role/AWSServiceRoleForEventBridge",
    "arn:aws:iam::aws:role/AWSServiceRoleForS3Replications"
  ]
  actions            = ["sts:AssumeRole"]
  policy_name        = "example-policy"
  policy_description = "Example policy for various resources"
  chunk_size         = 10
}

output "iam_policy_names" {
  value = module.iam_policy_chunker.policy_names
}
