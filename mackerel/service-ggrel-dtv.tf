resource "mackerel_service" "ggrel_dtv" {
  memo = "Ggrel DTV Services"
  name = "Ggrel-DTV"
}
resource "mackerel_role" "ggrel_dtv_host" {
  name    = "host"
  service = mackerel_service.ggrel_dtv.name
}
resource "mackerel_monitor" "ggrel_dtv_mirakurun" {
  name = "Mirakurun"
  external {
    follow_redirect = true
    headers = {
      Cache-Control = "no-cache"
      Authorization = var.MIRAKURUN_MONITOR_AUTHORIZATION_HEADER
    }
    max_check_attempts     = 3
    method                 = "GET"
    response_time_critical = 10000
    response_time_duration = 3
    response_time_warning  = 5000
    service                = mackerel_service.ggrel_dtv.name
    url                    = "https://dtv.ggrel.net/mirakurun/"
  }
}

moved {
  from = mackerel_service.ggrel-dtv_F2A87E62
  to   = mackerel_service.ggrel_dtv
}

moved {
  from = mackerel_role.ggrel-dtv_host_EDF88B2B
  to   = mackerel_role.ggrel_dtv_host
}

moved {
  from = mackerel_monitor.ggrel-dtv_mirakurun_B09B7D26
  to   = mackerel_monitor.ggrel_dtv_mirakurun
}
