resource "mackerel_monitor" "connectivity" {
  name = "connectivity"
  connectivity {}
}

resource "mackerel_monitor" "materia_crashloopbackoff" {
  name = "Materia CrashLoopBackOff"
  query {
    query    = "sum(kube_pod_container_status_waiting_reason{reason=\"CrashLoopBackOff\"} or vector(0))"
    legend   = "CrashLoopBackOff pods"
    operator = ">"
    critical = "0"
  }
}

resource "mackerel_monitor" "materia_imagepull_error" {
  name = "Materia ImagePullエラー"
  query {
    query    = "sum(kube_pod_container_status_waiting_reason{reason=~\"ImagePullBackOff|ErrImagePull\"} or vector(0))"
    legend   = "ImagePull error pods"
    operator = ">"
    critical = "0"
  }
}
