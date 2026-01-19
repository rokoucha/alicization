resource "mackerel_service" "materia-cluster_B2618D78" {
  name = "materia-cluster"
}
resource "mackerel_role" "materia-cluster_controller_E38B8C90" {
  name    = "controller"
  service = "${mackerel_service.materia-cluster_B2618D78.name}"
}
resource "mackerel_role" "materia-cluster_worker_1576E5E1" {
  name    = "worker"
  service = "${mackerel_service.materia-cluster_B2618D78.name}"
}
