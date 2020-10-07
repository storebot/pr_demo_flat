resource "aws_iam_role_policy" "iamRolePolicyWithFullAdminCntrl" {
  name = "test"
  role = "test"

  policy = "{\"Statement\":[{\"Action\":[\"##resource:action##\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
}