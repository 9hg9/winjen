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
}
