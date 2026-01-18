terraform {
  required_providers {
    mackerel = {
      version = "0.7.0"
      source  = "registry.terraform.io/mackerelio-labs/mackerel"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "mackerel"
    }
  }

}

provider "mackerel" {
}


variable "MIRAKURUN_MONITOR_AUTHORIZATION_HEADER" {
  description = "Mirakurun monitor authorization header"
  type        = string
  sensitive   = true
}
variable "WATCHDOGS_WEBHOOK_URL" {
  description = "watchdogs webhook url"
  type        = string
}
resource "mackerel_channel" "discord" {
  name = "Discord"
  slack {
    enabled_graph_image = true
    events = [
      "alert"
    ]
    url = "${var.WATCHDOGS_WEBHOOK_URL}"
  }
}
resource "mackerel_notification_group" "default" {
  child_channel_ids = [
    "${mackerel_channel.discord.id}"
  ]
  name = "Default"
}
resource "mackerel_monitor" "connectivity" {
  name = "connectivity"
  connectivity {

  }
}
resource "mackerel_service" "materia-cluster_B2618D78" {
  name = "materia-cluster"
}
resource "mackerel_role" "materia-cluster_controller_E38B8C90" {
  name    = "controller"
  service = "${mackerel_service.materia-cluster_B2618D78.name}"
}
resource "mackerel_role" "materia-cluster_worker_1576E5E1" {
  name    = "worker"
  service = "${mackerel_service.materia-cluster_B2618D78.name}"
}
resource "mackerel_service" "ggrel-dtv_F2A87E62" {
  memo = "Ggrel DTV Services"
  name = "Ggrel-DTV"
}
resource "mackerel_role" "ggrel-dtv_host_EDF88B2B" {
  name    = "host"
  service = "${mackerel_service.ggrel-dtv_F2A87E62.name}"
}
resource "mackerel_monitor" "ggrel-dtv_mirakurun_B09B7D26" {
  name = "Mirakurun"
  external {
    follow_redirect = true
    headers = {
      Cache-Control = "no-cache"
      Authorization = "${var.MIRAKURUN_MONITOR_AUTHORIZATION_HEADER}"
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 5000
    service                = "${mackerel_service.ggrel-dtv_F2A87E62.name}"
    url                    = "https://dtv.ggrel.net/mirakurun/"
  }
}
resource "mackerel_service" "ggrel_40CEA253" {
  name = "Ggrel"
}
resource "mackerel_monitor" "ggrel_ggrel-net_25A56417" {
  name = "ggrel.net"
  external {
    certification_expiration_critical = 3
    certification_expiration_warning  = 7
    headers = {
      Cache-Control = "no-cache"
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 5000
    service                = "${mackerel_service.ggrel_40CEA253.name}"
    url                    = "https://ggrel.net"
  }
}
resource "mackerel_monitor" "ggrel_heinrike-prinzessin-zu-sayn-wittgenste-in_D45C91BB" {
  name = "heinrike.prinzessin.zu.sayn-wittgenste.in"
  external {
    certification_expiration_critical = 3
    certification_expiration_warning  = 7
    headers = {
      Cache-Control = "no-cache"
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 5000
    service                = "${mackerel_service.ggrel_40CEA253.name}"
    url                    = "https://heinrike.prinzessin.zu.sayn-wittgenste.in"
  }
}
resource "mackerel_monitor" "ggrel_mastodon-rokoucha_78BB964D" {
  name = "Mastodon/Rokoucha"
  external {
    follow_redirect = true
    headers = {
      Cache-Control = "no-cache"
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 5000
    service                = "${mackerel_service.ggrel_40CEA253.name}"
    url                    = "https://ma.rokoucha.net"
  }
}
resource "mackerel_monitor" "ggrel_rokoucha-net_764AE37B" {
  name = "rokoucha.net"
  external {
    certification_expiration_critical = 3
    certification_expiration_warning  = 7
    headers = {
      Cache-Control = "no-cache"
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 7500
    service                = "${mackerel_service.ggrel_40CEA253.name}"
    url                    = "https://rokoucha.net"
  }
}
resource "mackerel_service" "machines_1FDC4DD8" {
  name = "machines"
}
resource "mackerel_role" "machines_physical_5CF0CDF0" {
  name    = "physical"
  service = "${mackerel_service.machines_1FDC4DD8.name}"
}
resource "mackerel_role" "machines_virtual_1052FA1B" {
  name    = "virtual"
  service = "${mackerel_service.machines_1FDC4DD8.name}"
}
resource "mackerel_monitor" "machines_anomaly-detection_DF4BC1DC" {
  name = "異状検知"
  anomaly_detection {
    critical_sensitivity = "insensitive"
    max_check_attempts   = 5
    scopes = [
      "${mackerel_role.machines_physical_5CF0CDF0.id}"
    ]
    warning_sensitivity = "normal"
  }
}
