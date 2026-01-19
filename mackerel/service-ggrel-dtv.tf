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
