terraform {
  required_providers {
    mackerel = {
      version = "0.9.0"
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
