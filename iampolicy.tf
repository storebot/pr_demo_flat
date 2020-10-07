resource "aws_iam_policy" "iamPolicyWithFullAdminControl" {
  name = "test"

  policy = "{\"Statement\":[{\"Action\":[\"##resource:action##\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
}