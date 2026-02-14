terraform {
  required_providers {
    aws = {
      version = "6.32.1"
      source  = "aws"
    }
    tls = {
      version = "4.2.1"
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
