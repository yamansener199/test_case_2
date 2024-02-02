variable "RdsAdminCreds1" {
  default = {
    username = "DUMMYUSER"
    password = "DUMMYPASS"
  }
  type = map(string)
}

resource "aws_secretsmanager_secret" "RdsAdminCreds1" {
  name = "RdsAdminCreds1"
}
resource "aws_secretsmanager_secret_version" "RdsAdminCreds1" {
  secret_id     = aws_secretsmanager_secret.RdsAdminCreds1.id
  secret_string = jsonencode(var.RdsAdminCreds1)
}