terraform {
  required_providers {
    cloudflare = {
      version = "4.52.5"
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
