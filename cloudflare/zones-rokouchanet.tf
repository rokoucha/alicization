resource "cloudflare_zone" "zones_rokouchanet_zone_DF751E70" {
  account_id = cloudflare_account.account.id
  name       = "rokoucha.net"
}

import {
  to = cloudflare_zone.zones_rokouchanet_zone_DF751E70
  id = "bc6a492f5a6197ebdb5825bb9c3f30f3"
}
