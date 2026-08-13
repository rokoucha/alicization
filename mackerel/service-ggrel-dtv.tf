resource "mackerel_service" "ggrel_dtv" {
  memo = "Ggrel DTV Services"
  name = "Ggrel-DTV"
}
resource "mackerel_role" "ggrel_dtv_host" {
  name    = "host"
  service = mackerel_service.ggrel_dtv.name
}
