resource "mackerel_service" "ggrel" {
  name = "Ggrel"
}
removed {
  from = mackerel_monitor.ggrel_net
  lifecycle {
    destroy = false
  }
}
removed {
  from = mackerel_monitor.heinrike_prinzessin_zu_sayn_wittgenste_in
  lifecycle {
    destroy = false
  }
}
removed {
  from = mackerel_monitor.mastodon_rokoucha
  lifecycle {
    destroy = false
  }
}
resource "mackerel_monitor" "rokoucha_net" {
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
    service                = mackerel_service.ggrel.name
    url                    = "https://rokoucha.net"
  }
}
removed {
  from = mackerel_monitor.noa_pp_ua
  lifecycle {
    destroy = false
  }
}
