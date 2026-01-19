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
