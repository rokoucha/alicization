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

moved {
  from = mackerel_service.materia-cluster_B2618D78
  to   = mackerel_service.materia_cluster
}

moved {
  from = mackerel_role.materia-cluster_controller_E38B8C90
  to   = mackerel_role.materia_cluster_controller
}

moved {
  from = mackerel_role.materia-cluster_worker_1576E5E1
  to   = mackerel_role.materia_cluster_worker
}
