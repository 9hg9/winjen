## AWS1팀 한승완

terraform {
  required_version = ">=1.0.0, <2.0.0" # 1.0.0 <version <2.0.0

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0" # 5.0<version<6.0
    }
  }
}

provider "aws" {
  region     = "ap-northeast-2"
  # Hard-coding credentials is not recommended
  access_key = data.aws_secretsmanager_secret.by-arn.AWS_ACCESS_KEY_ID
  secret_key = data.aws_secretsmanager_secret.by-arn.AWS_SECRET_ACCESS_KEY
}
