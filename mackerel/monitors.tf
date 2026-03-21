resource "mackerel_monitor" "connectivity" {
  name = "connectivity"
  # Keep this empty block: it selects the "connectivity" monitor type.
  connectivity {

  }
}
import {
  to = mackerel_monitor.litestream_shadow_wal_size
  id = "5o1EhqZ3XMS"
}
resource "mackerel_monitor" "litestream_shadow_wal_size" {
  name = "Litestream Shadow WALサイズ肥大化"
  memo = "レプリカ数が増えていなければ同期に失敗している"
  query {
    query    = "litestream_shadow_wal_size{service.name=\"litestream\"}"
    legend   = "{{service.instance.id}}: {{db}}"
    operator = ">"
    warning  = "25000000"
    critical = "50000000"
  }
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
