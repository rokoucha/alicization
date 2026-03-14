resource "cloudflare_zone" "zones_noappua_zone_62EBFFE8" {
  account_id = cloudflare_account.account.id
  name       = "noa.pp.ua"
}

import {
  to = cloudflare_zone.zones_noappua_zone_62EBFFE8
  id = "927ab1a27118ed30a120752399609a90"
}
