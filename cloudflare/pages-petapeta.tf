resource "cloudflare_pages_project" "pages_petapeta_CB57F07D" {
  account_id        = cloudflare_account.account.id
  name              = "petapeta"
  production_branch = "master"
  build_config {
    build_command   = "yarn run build"
    destination_dir = "dist"
  }
  deployment_configs {
    production {
      environment_variables = {
        NODE_VERSION = "20"
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
      repo_name                  = "petapeta"
    }
  }
}
