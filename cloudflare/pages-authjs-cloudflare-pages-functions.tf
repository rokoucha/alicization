resource "cloudflare_pages_project" "pages_auth-js-cloudflare-pages-functions_authjs-cloudflare-pages-functions_359294B8" {
  account_id        = cloudflare_account.account.id
  name              = "authjs-cloudflare-pages-functions"
  production_branch = "main"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build"
    destination_dir = "./public"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-12-03"
      compatibility_flags = [

      ]
      environment_variables = {
        AUTH_GITHUB_ID = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_ID_66A2BFFB}"
        NODE_VERSION   = "20"
      }
      fail_open = false
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_SECRET_C4ED44EC}"
        AUTH_SECRET        = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_SECRET_616905F8}"
      }
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "none"
      production_branch          = "main"
      repo_name                  = "authjs-cloudflare-pages-functions"
    }
  }
}
