resource "tfe_workspace" "cloudflare" {
  name              = "cloudflare"
  organization      = tfe_organization.organization.name
  project_id        = tfe_project.alicization.id
  queue_all_runs    = false
  terraform_version = "~> 1.14.0"
  working_directory = "cloudflare"
  auto_apply        = true
  vcs_repo {
    github_app_installation_id = "ghain-xjmjBBumtkKgKZej"
    identifier                 = "rokoucha/alicization"
  }
}
resource "tfe_notification_configuration" "cloudflare-notification-discord" {
  destination_type = "slack"
  enabled          = true
  name             = "Discord"
  triggers = [
    "run:errored",
    "run:needs_attention",
  ]
  url          = var.DISCORD_NOTIFICATION_WEBHOOK_URL
  workspace_id = tfe_workspace.cloudflare.id
}
resource "tfe_variable" "cloudflare-CLOUDFLARE_API_TOKEN" {
  category     = "env"
  key          = "CLOUDFLARE_API_TOKEN"
  sensitive    = true
  workspace_id = tfe_workspace.cloudflare.id
}
