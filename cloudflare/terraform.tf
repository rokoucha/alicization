terraform {
  required_providers {
    cloudflare = {
      version = "5.20.0"
      source  = "cloudflare/cloudflare"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "cloudflare"
    }
  }

}
