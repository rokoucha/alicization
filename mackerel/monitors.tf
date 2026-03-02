resource "mackerel_monitor" "connectivity" {
  name = "connectivity"
  # Keep this empty block: it selects the "connectivity" monitor type.
  connectivity {

  }
}
