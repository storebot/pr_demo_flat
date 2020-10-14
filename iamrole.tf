resource "aws_iam_role" "iamRoleWithFullAdminCntrl" {
  name = "test"

  assume_role_policy = "{\"Statement\":[{\"Action\":[\"##resource:action##\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"

  tags = {
    tag-key = "tag-value"
  }
}