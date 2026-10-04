resource "mackerel_service" "ggrel" {
  name = "Ggrel"
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
