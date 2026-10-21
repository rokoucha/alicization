terraform {
  required_providers {
    aws = {
      version = "6.69.1"
      source  = "aws"
    }
    tls = {
      version = "4.4.2"
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
