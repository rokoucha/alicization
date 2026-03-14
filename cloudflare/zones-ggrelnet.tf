resource "cloudflare_zone" "zones_ggrelnet_zone_C68FFF1A" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "ggrel.net"
}

import {
  to = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A
  id = "8797b62049f417096e6bba991ebbbc6a"
}
