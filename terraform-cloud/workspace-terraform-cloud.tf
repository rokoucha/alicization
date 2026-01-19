resource "tfe_workspace" "terraform-cloud" {
  name              = "terraform-cloud"
  organization      = tfe_organization.organization.name
  project_id        = tfe_project.alicization.id
  queue_all_runs    = false
  terraform_version = "~> 1.14.0"
  working_directory = "terraform-cloud"
  auto_apply        = true
  vcs_repo {
    github_app_installation_id = "ghain-xjmjBBumtkKgKZej"
    identifier                 = "rokoucha/alicization"
  }
}
resource "tfe_notification_configuration" "terraform-cloud-notification-discord" {
  destination_type = "slack"
  enabled          = true
  name             = "Discord"
  triggers = [
    "run:errored",
    "run:needs_attention",
  ]
  url          = var.DISCORD_NOTIFICATION_WEBHOOK_URL
  workspace_id = tfe_workspace.terraform-cloud.id
}
resource "tfe_variable" "terraform-cloud-TFC_ORGANIZATION_EMAIL" {
  category     = "terraform"
  key          = "TFC_ORGANIZATION_EMAIL"
  workspace_id = tfe_workspace.terraform-cloud.id
  lifecycle {
    ignore_changes = [
      "value",
    ]
  }
}
resource "tfe_variable" "terraform-cloud-TFE_TOKEN" {
  category     = "env"
  key          = "TFE_TOKEN"
  sensitive    = true
  workspace_id = tfe_workspace.terraform-cloud.id
}
resource "tfe_variable" "terraform-cloud-DISCORD_NOTIFICATION_WEBHOOK_URL" {
  category     = "terraform"
  key          = "DISCORD_NOTIFICATION_WEBHOOK_URL"
  sensitive    = true
  workspace_id = tfe_workspace.terraform-cloud.id
}
