terraform {
  required_providers {
    mackerel = {
      version = "0.8.1"
      source  = "registry.terraform.io/mackerelio-labs/mackerel"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "mackerel"
    }
  }

}
