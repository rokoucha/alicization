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
