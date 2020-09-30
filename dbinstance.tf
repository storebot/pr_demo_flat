resource "aws_db_instance" "rdsBackupDisbaled" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.m5.xlarge"
  name                    = "mydb"
  backup_retention_period = 30
  storage_encrypted       = true
}

resource "aws_db_instance" "rdsIamAuthDisabled" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.m5.xlarge"
  name                                = "mydb"
  backup_retention_period             = 90
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
}