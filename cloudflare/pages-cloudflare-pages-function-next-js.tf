resource "cloudflare_pages_project" "pages_cloudflare-pages-function-next-js_96D3039F" {
  account_id        = cloudflare_account.account.id
  name              = "cloudflare-pages-function-next-js"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build:next"
    destination_dir = ".vercel/output/static"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-07-22"
      compatibility_flags = [
        "nodejs_compat"
      ]
      environment_variables = {
        AUTH_GITHUB_ID  = "${var.pages_cloudflare-pages-function-next-js_AUTH_GITHUB_ID_1482998B}"
        AUTH_TRUST_HOST = "cloudflare-pages-function-next-js.pages.dev"
        NODE_VERSION    = "20"
      }
      fail_open = true
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_cloudflare-pages-function-next-js_AUTH_GITHUB_SECRET_74848C5F}"
        AUTH_SECRET        = "${var.pages_cloudflare-pages-function-next-js_AUTH_SECRET_20C3562D}"
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
      repo_name                  = "cloudflare-pages-function-next-js"
    }
  }
}
