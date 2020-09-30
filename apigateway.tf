resource "aws_api_gateway_stage" "apiGatewayLogging" {
  stage_name    = "prod"
  rest_api_id   = "some-id"
  deployment_id = "some-id"

  access_log_settings {
    destination_arn = "<destination_arn>"
    format          = "<format>>"
  }
}