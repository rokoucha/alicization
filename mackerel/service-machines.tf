resource "mackerel_service" "machines" {
  name = "machines"
}
resource "mackerel_role" "machines_physical" {
  name    = "physical"
  service = mackerel_service.machines.name
}
resource "mackerel_role" "machines_virtual" {
  name    = "virtual"
  service = mackerel_service.machines.name
}
resource "mackerel_monitor" "machines_anomaly_detection" {
  name = "異状検知"
  anomaly_detection {
    critical_sensitivity = "insensitive"
    max_check_attempts   = 5
    scopes = [
      mackerel_role.machines_physical.id
    ]
    warning_sensitivity = "normal"
  }
}
