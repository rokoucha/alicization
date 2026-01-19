resource "cloudflare_pages_project" "pages_cwskk_E3C50676" {
  account_id        = cloudflare_account.account.id
  name              = "cwskk"
  production_branch = "master"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build:preview"
    destination_dir = "dist/preview"
  }
  deployment_configs {
    production {
      environment_variables = {
        NODE_VERSION = "22"
      }
      fail_open   = true
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
      repo_name                  = "cwskk"
    }
  }
}
