terraform {
  required_providers {
    tfe = {
      version = "0.73.0"
      source  = "hashicorp/tfe"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "terraform-cloud"
    }
  }

}

provider "tfe" {
}

variable "TFC_ORGANIZATION_EMAIL" {
  description = "Terraform Cloud organization email"
  type        = string
}

variable "DISCORD_NOTIFICATION_WEBHOOK_URL" {
  description = "Discord notification webhook URL for Terraform Cloud"
  type        = string
}
resource "tfe_organization" "organization" {
  email                               = var.TFC_ORGANIZATION_EMAIL
  name                                = "rokoucha"
  speculative_plan_management_enabled = false
}
resource "tfe_project" "alicization" {
  name         = "alicization"
  organization = tfe_organization.organization.name
}
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
