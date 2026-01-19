resource "cloudflare_pages_project" "pages_tweet2scrapbox_6AE43398" {
  account_id        = cloudflare_account.account.id
  name              = "tweet2scrapbox"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "public"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-04-20"
      environment_variables = {
        NODE_VERSION = "20"
      }
      fail_open = true
      secrets = {
        TWITTER_BEARER_TOKEN = "${var.pages_tweet2scrapbox_TWITTER_BEARER_TOKEN_2DED0709}"
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
      preview_deployment_setting = "all"
      production_branch          = "master"
      repo_name                  = "tweet2scrapbox"
    }
  }
}
