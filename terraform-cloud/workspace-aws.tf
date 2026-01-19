resource "tfe_workspace" "aws" {
  name              = "aws"
  organization      = tfe_organization.organization.name
  project_id        = tfe_project.alicization.id
  queue_all_runs    = false
  terraform_version = "~> 1.14.0"
  working_directory = "aws"
  auto_apply        = true
  vcs_repo {
    github_app_installation_id = "ghain-xjmjBBumtkKgKZej"
    identifier                 = "rokoucha/alicization"
  }
}
resource "tfe_notification_configuration" "aws-notification-discord" {
  destination_type = "slack"
  enabled          = true
  name             = "Discord"
  triggers = [
    "run:errored",
    "run:needs_attention",
  ]
  url          = var.DISCORD_NOTIFICATION_WEBHOOK_URL
  workspace_id = tfe_workspace.aws.id
}
resource "tfe_variable" "aws-TFC_AWS_PROVIDER_AUTH" {
  category     = "env"
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  workspace_id = tfe_workspace.aws.id
}
resource "tfe_variable" "aws-TFC_AWS_RUN_ROLE_ARN" {
  category     = "env"
  key          = "TFC_AWS_RUN_ROLE_ARN"
  workspace_id = tfe_workspace.aws.id
  lifecycle {
    ignore_changes = [
      "value",
    ]
  }
}
