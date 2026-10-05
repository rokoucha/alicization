terraform {
  required_providers {
    cloudflare = {
      version = "5.26.0"
      source  = "registry.terraform.io/cloudflare/cloudflare"
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
