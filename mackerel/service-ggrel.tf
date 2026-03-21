resource "mackerel_service" "ggrel" {
  name = "Ggrel"
}
resource "mackerel_monitor" "ggrel_net" {
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
    service                = mackerel_service.ggrel.name
    url                    = "https://ggrel.net"
  }
}
resource "mackerel_monitor" "heinrike_prinzessin_zu_sayn_wittgenste_in" {
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
    service                = mackerel_service.ggrel.name
    url                    = "https://heinrike.prinzessin.zu.sayn-wittgenste.in"
  }
}
resource "mackerel_monitor" "mastodon_rokoucha" {
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
    service                = mackerel_service.ggrel.name
    url                    = "https://ma.rokoucha.net"
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
import {
  to = mackerel_monitor.noa_pp_ua
  id = "5hPDCvdJY6f"
}
resource "mackerel_monitor" "noa_pp_ua" {
  name = "noa.pp.ua"
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
    service                = mackerel_service.ggrel.name
    url                    = "https://noa.pp.ua"
  }
}
