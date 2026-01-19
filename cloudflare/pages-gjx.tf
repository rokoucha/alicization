resource "cloudflare_pages_project" "pages_gjx_DF6C2770" {
  account_id        = cloudflare_account.account.id
  name              = "gjx"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "build"
  }
  deployment_configs {
    production {
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
      preview_deployment_setting = "none"
      production_branch          = "master"
      repo_name                  = "gjx"
    }
  }
}
