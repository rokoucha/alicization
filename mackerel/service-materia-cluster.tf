resource "mackerel_service" "materia_cluster" {
  name = "materia-cluster"
}
resource "mackerel_role" "materia_cluster_controller" {
  name    = "controller"
  service = mackerel_service.materia_cluster.name
}
resource "mackerel_role" "materia_cluster_worker" {
  name    = "worker"
  service = mackerel_service.materia_cluster.name
}
