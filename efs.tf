resource "aws_efs_file_system" "efsNotEncrypted" {
  creation_token = "my-product"

  tags = {
    Name = "not-encrypted"
  }
  encrypted = true
}


resource "aws_efs_file_system" "efsEncryptedFalse" {
  creation_token = "my-product"

  tags = {
    Name = "encrypted"
  }

  encrypted = true

}

resource "aws_efs_file_system" "efsEncryptedWithNoKms" {
  creation_token = "my-product"

  tags = {
    Name = "encrypted"
  }

  encrypted = true

  kms_key_id = "<kms_key_id>"
}
