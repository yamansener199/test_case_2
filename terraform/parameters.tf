variable "RdsAdminCreds" {
  default = {
    username = "master_user"
    password = "dbadmin#02avia"
  }
  type = map(string)
}

resource "aws_secretsmanager_secret" "RdsAdminCreds" {
  name = "RdsAdminCred"
}
resource "aws_secretsmanager_secret_version" "RdsAdminCreds" {
  secret_id     = aws_secretsmanager_secret.RdsAdminCred.id
  secret_string = jsonencode(var.RdsAdminCreds)
}