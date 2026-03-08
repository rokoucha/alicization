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

moved {
  from = mackerel_service.machines_1FDC4DD8
  to   = mackerel_service.machines
}

moved {
  from = mackerel_role.machines_physical_5CF0CDF0
  to   = mackerel_role.machines_physical
}

moved {
  from = mackerel_role.machines_virtual_1052FA1B
  to   = mackerel_role.machines_virtual
}

moved {
  from = mackerel_monitor.machines_anomaly-detection_DF4BC1DC
  to   = mackerel_monitor.machines_anomaly_detection
}
