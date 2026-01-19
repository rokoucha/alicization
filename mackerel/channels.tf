resource "mackerel_channel" "discord" {
  name = "Discord"
  slack {
    enabled_graph_image = true
    events = [
      "alert"
    ]
    url = "${var.WATCHDOGS_WEBHOOK_URL}"
  }
}
