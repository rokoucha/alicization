resource "cloudflare_pages_project" "pages_super-seisan_FC830EEF" {
  account_id        = cloudflare_account.account.id
  name              = "super-seisan"
  production_branch = "main"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "dist"
    root_dir        = "./legacy"
  }
  deployment_configs {
    production {
      compatibility_date = "2025-11-17"
      environment_variables = {

      }
      fail_open   = true
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner               = "rokoucha"
      pr_comments_enabled = true
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "all"
      production_branch          = "main"
      repo_name                  = "super-seisan"
    }
  }
}
