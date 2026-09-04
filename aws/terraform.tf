terraform {
  required_providers {
    aws = {
      version = "6.63.0"
      source  = "aws"
    }
    tls = {
      version = "4.4.0"
      source  = "hashicorp/tls"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "aws"
    }
  }
}
