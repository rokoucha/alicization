resource "cloudflare_zone" "zones_sayn-wittgenstein_zone_DB53E6D0" {
  account_id = cloudflare_account.account.id
  name       = "sayn-wittgenste.in"
}

import {
  to = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0
  id = "3e6532956ee9bac8397fe88e84bfc793"
}
