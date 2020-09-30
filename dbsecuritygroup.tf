resource "aws_db_security_group" "rdsHostsHigherThan256" {
  name = "rds_sg"

  ingress {
    cidr = "<ingress.cidr>"
  }
}

resource "aws_db_security_group" "rdsIsPublic" {
  name = "rds_sg"

  ingress {
    cidr = "<ingress.cidr>"
  }
}

resource "aws_db_security_group" "rdsScopeIsPublic" {
  name = "rds_sg"

  ingress {
    cidr = "<ingress.cidr>"
  }
}