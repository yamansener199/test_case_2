variable "RdsAdminCreds1" {
  default = {
    username = "master_user"
    password = "dbadmin#02avia"
  }
  type = map(string)
}

resource "aws_secretsmanager_secret" "RdsAdminCreds1" {
  name = "RdsAdminCred"
}
resource "aws_secretsmanager_secret_version" "RdsAdminCreds1" {
  secret_id     = aws_secretsmanager_secret.RdsAdminCreds1.id
  secret_string = jsonencode(var.RdsAdminCreds1)
}