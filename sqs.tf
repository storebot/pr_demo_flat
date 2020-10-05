resource "aws_sqs_queue" "sqsSseDisabled" {
  name = "terraform-example-queue"
}

resource "aws_sqs_queue" "sqsQueueExposed" {
  name                              = "terraform-example-queue"
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  policy                            = "{\"Statement\":[{\"Action\":\"sqs:*\",\"Effect\":\"Allow\",\"Principal\":\"##principal###\",\"Resource\":\"arn:aws:sqs:*:111122223333:queue1\",\"Sid\":\"Queue1_AnonymousAccess_AllActions_WhitelistIP\"}],\"Version\":\"2012-10-17\"}"
}