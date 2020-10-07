resource "aws_sns_topic" "snsPublicAccess" {
  name   = "terraform-example-queue"
  policy = "{\"Statement\":[{\"Action\":[\"SNS:*\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"##principal##\"},\"Resource\":\"arn:aws:sns:us-east-2:123456789012:MyTopic\",\"Sid\":\"Queue1_AnonymousAccess_AllActions_WhitelistIP\"}],\"Version\":\"2012-10-17\"}"
}