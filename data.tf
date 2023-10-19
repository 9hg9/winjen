
data "aws_secretsmanager_secret" "hsw"{
  arn = "arn:aws:secretsmanager:ap-northeast-2:723926525504:secret:hsw-lywuWG"
}

data "aws_secretsmanager_secret_version" "by" {
  secret_id     = data.aws_secretsmanager_secret.hsw.id
  version_stage = "example"
}

variable "key" {
  default = {
    id = jsondecode(data.aws_secretsmanager_secret_version.by.secret_string)["AWS_ACCESS_KEY_ID"]
    pwd = jsondecode(data.aws_secretsmanager_secret_version.by.secret_string)["AWS_SECRET_ACCESS_KEY"]
  }
}
