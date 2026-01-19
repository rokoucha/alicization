resource "tfe_workspace" "mackerel" {
  name              = "mackerel"
  organization      = tfe_organization.organization.name
  project_id        = tfe_project.alicization.id
  queue_all_runs    = false
  terraform_version = "~> 1.14.0"
  working_directory = "mackerel"
  auto_apply        = true
  vcs_repo {
    github_app_installation_id = "ghain-xjmjBBumtkKgKZej"
    identifier                 = "rokoucha/alicization"
  }
}
resource "tfe_notification_configuration" "mackerel-notification-discord" {
  destination_type = "slack"
  enabled          = true
  name             = "Discord"
  triggers = [
    "run:errored",
    "run:needs_attention",
  ]
  url          = var.DISCORD_NOTIFICATION_WEBHOOK_URL
  workspace_id = tfe_workspace.mackerel.id
}
resource "tfe_variable" "mackerel-WATCHDOGS_WEBHOOK_URL" {
  category     = "terraform"
  key          = "WATCHDOGS_WEBHOOK_URL"
  workspace_id = tfe_workspace.mackerel.id
  lifecycle {
    ignore_changes = [
      "value",
    ]
  }
}
resource "tfe_variable" "mackerel-MACKEREL_API_KEY" {
  category     = "env"
  key          = "MACKEREL_API_KEY"
  sensitive    = true
  workspace_id = tfe_workspace.mackerel.id
}
resource "tfe_variable" "mackerel-MIRAKURUN_MONITOR_AUTHORIZATION_HEADER" {
  category     = "terraform"
  key          = "MIRAKURUN_MONITOR_AUTHORIZATION_HEADER"
  sensitive    = true
  workspace_id = tfe_workspace.mackerel.id
}
