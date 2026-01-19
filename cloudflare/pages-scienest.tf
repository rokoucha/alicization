resource "cloudflare_pages_project" "pages_scienest_20D3D293" {
  account_id        = cloudflare_account.account.id
  name              = "scienest"
  production_branch = "master"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build:next"
    destination_dir = ".vercel/output/static"
  }
  deployment_configs {
    production {
      compatibility_date = "2024-06-03"
      compatibility_flags = [
        "nodejs_compat"
      ]
      d1_databases = {
        DB = "6932807b-60cc-425a-b309-eebcea6f13c4"
      }
      environment_variables = {
        APP_ENV                = "production"
        AUTH_GITHUB_ID         = "${var.pages_scienest_AUTH_GITHUB_ID_14B14276}"
        AUTH_TRUST_HOST        = "rokoucha.net"
        BASE_URL               = "https://rokoucha.net"
        GITHUB_USER_ID         = "6058487"
        NODE_VERSION           = "20"
        SITE_DESCRIPTION       = "The world isn't my oyster."
        SITE_LANG              = "ja"
        SITE_NAME              = "Rokoucha"
        SITE_TWITTER_CARD_SITE = "@rokoucha"
      }
      fail_open = true
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_scienest_AUTH_GITHUB_SECRET_D05B4844}"
        AUTH_SECRET        = "${var.pages_scienest_AUTH_SECRET_5AB749E8}"
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
      production_branch          = "master"
      repo_name                  = "scienest"
    }
  }
}
