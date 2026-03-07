locals {
  github_app_installation_id = "ghain-xjmjBBumtkKgKZej"
  repository_identifier      = "rokoucha/alicization"
  discord_notification_triggers = [
    "run:errored",
    "run:needs_attention",
  ]

  workspaces = {
    aws = {
      terraform_version = "~> 1.14.0"
      working_directory = "aws"
      variables = {
        TFC_AWS_PROVIDER_AUTH = {
          category = "env"
          value    = "true"
        }
        TFC_AWS_RUN_ROLE_ARN = {
          category             = "env"
          ignore_value_changes = true
        }
      }
    }
    cloudflare = {
      terraform_version = "~> 1.14.0"
      working_directory = "cloudflare"
      variables = {
        CLOUDFLARE_API_TOKEN = {
          category  = "env"
          sensitive = true
        }
      }
    }
    mackerel = {
      terraform_version = "~> 1.14.0"
      working_directory = "mackerel"
      variables = {
        WATCHDOGS_WEBHOOK_URL = {
          category             = "terraform"
          ignore_value_changes = true
        }
        MACKEREL_API_KEY = {
          category  = "env"
          sensitive = true
        }
        MIRAKURUN_MONITOR_AUTHORIZATION_HEADER = {
          category  = "terraform"
          sensitive = true
        }
      }
    }
    "terraform-cloud" = {
      terraform_version = "~> 1.14.0"
      working_directory = "terraform-cloud"
      variables = {
        TFC_ORGANIZATION_EMAIL = {
          category             = "terraform"
          ignore_value_changes = true
        }
        TFE_TOKEN = {
          category  = "env"
          sensitive = true
        }
        DISCORD_NOTIFICATION_WEBHOOK_URL = {
          category  = "terraform"
          sensitive = true
        }
      }
    }
  }

  workspace_variables = merge([
    for workspace_name, workspace in local.workspaces : {
      for variable_name, variable in workspace.variables :
      "${workspace_name}/${variable_name}" => merge(variable, {
        key            = variable_name
        workspace_name = workspace_name
      })
    }
  ]...)

  managed_workspace_variables = {
    for key, variable in local.workspace_variables :
    key => variable
    if !try(variable.ignore_value_changes, false)
  }

  ignored_workspace_variables = {
    for key, variable in local.workspace_variables :
    key => variable
    if try(variable.ignore_value_changes, false)
  }
}

resource "tfe_workspace" "this" {
  for_each = local.workspaces

  name              = each.key
  organization      = tfe_organization.organization.name
  project_id        = tfe_project.alicization.id
  queue_all_runs    = false
  terraform_version = each.value.terraform_version
  working_directory = each.value.working_directory
  auto_apply        = true

  vcs_repo {
    github_app_installation_id = local.github_app_installation_id
    identifier                 = local.repository_identifier
  }
}

resource "tfe_notification_configuration" "discord" {
  for_each = local.workspaces

  destination_type = "slack"
  enabled          = true
  name             = "Discord"
  triggers         = local.discord_notification_triggers
  url              = var.DISCORD_NOTIFICATION_WEBHOOK_URL
  workspace_id     = tfe_workspace.this[each.key].id
}

resource "tfe_variable" "managed" {
  for_each = local.managed_workspace_variables

  category     = each.value.category
  key          = each.value.key
  sensitive    = try(each.value.sensitive, false)
  value        = try(each.value.value, null)
  workspace_id = tfe_workspace.this[each.value.workspace_name].id
}

resource "tfe_variable" "ignored" {
  for_each = local.ignored_workspace_variables

  category     = each.value.category
  key          = each.value.key
  sensitive    = try(each.value.sensitive, false)
  value        = try(each.value.value, null)
  workspace_id = tfe_workspace.this[each.value.workspace_name].id

  lifecycle {
    ignore_changes = [value]
  }
}

moved {
  from = tfe_workspace.aws
  to   = tfe_workspace.this["aws"]
}

moved {
  from = tfe_workspace.cloudflare
  to   = tfe_workspace.this["cloudflare"]
}

moved {
  from = tfe_workspace.mackerel
  to   = tfe_workspace.this["mackerel"]
}

moved {
  from = tfe_workspace.terraform-cloud
  to   = tfe_workspace.this["terraform-cloud"]
}

moved {
  from = tfe_notification_configuration.aws-notification-discord
  to   = tfe_notification_configuration.discord["aws"]
}

moved {
  from = tfe_notification_configuration.cloudflare-notification-discord
  to   = tfe_notification_configuration.discord["cloudflare"]
}

moved {
  from = tfe_notification_configuration.mackerel-notification-discord
  to   = tfe_notification_configuration.discord["mackerel"]
}

moved {
  from = tfe_notification_configuration.terraform-cloud-notification-discord
  to   = tfe_notification_configuration.discord["terraform-cloud"]
}

moved {
  from = tfe_variable.aws-TFC_AWS_PROVIDER_AUTH
  to   = tfe_variable.managed["aws/TFC_AWS_PROVIDER_AUTH"]
}

moved {
  from = tfe_variable.aws-TFC_AWS_RUN_ROLE_ARN
  to   = tfe_variable.ignored["aws/TFC_AWS_RUN_ROLE_ARN"]
}

moved {
  from = tfe_variable.cloudflare-CLOUDFLARE_API_TOKEN
  to   = tfe_variable.managed["cloudflare/CLOUDFLARE_API_TOKEN"]
}

moved {
  from = tfe_variable.mackerel-WATCHDOGS_WEBHOOK_URL
  to   = tfe_variable.ignored["mackerel/WATCHDOGS_WEBHOOK_URL"]
}

moved {
  from = tfe_variable.mackerel-MACKEREL_API_KEY
  to   = tfe_variable.managed["mackerel/MACKEREL_API_KEY"]
}

moved {
  from = tfe_variable.mackerel-MIRAKURUN_MONITOR_AUTHORIZATION_HEADER
  to   = tfe_variable.managed["mackerel/MIRAKURUN_MONITOR_AUTHORIZATION_HEADER"]
}

moved {
  from = tfe_variable.terraform-cloud-TFC_ORGANIZATION_EMAIL
  to   = tfe_variable.ignored["terraform-cloud/TFC_ORGANIZATION_EMAIL"]
}

moved {
  from = tfe_variable.terraform-cloud-TFE_TOKEN
  to   = tfe_variable.managed["terraform-cloud/TFE_TOKEN"]
}

moved {
  from = tfe_variable.terraform-cloud-DISCORD_NOTIFICATION_WEBHOOK_URL
  to   = tfe_variable.managed["terraform-cloud/DISCORD_NOTIFICATION_WEBHOOK_URL"]
}
