terraform {
  required_providers {
    tfe = {
      version = "0.74.0"
      source  = "hashicorp/tfe"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "terraform-cloud"
    }
  }

}
