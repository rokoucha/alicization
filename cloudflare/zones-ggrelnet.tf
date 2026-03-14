resource "cloudflare_zone" "ggrel_net" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "ggrel.net"
}

import {
  to = cloudflare_zone.ggrel_net
  id = "8797b62049f417096e6bba991ebbbc6a"
}
