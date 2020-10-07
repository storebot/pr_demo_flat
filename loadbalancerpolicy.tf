resource "aws_load_balancer_policy" "elbWeakCipher" {
  load_balancer_name = "some-name"
  policy_name        = "wu-tang-ssl"
  policy_type_name   = "SSLNegotiationPolicyType"

  policy_attribute {
    name  = "AES256-SHA256"
    value = "true"
  }
}

resource "aws_load_balancer_policy" "elbSsLTsLProtocol" {
  load_balancer_name = "some-name"
  policy_name        = "wu-tang-ssl"
  policy_type_name   = "SSLNegotiationPolicyType"

  policy_attribute {
    name  = "Protocol-TLSv1.2"
    value = "true"
  }
}

