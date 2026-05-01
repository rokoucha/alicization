terraform {
  required_providers {
    cloudflare = {
      version = "5.19.1"
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
