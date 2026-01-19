terraform {
  required_providers {
    tfe = {
      version = "0.73.0"
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
