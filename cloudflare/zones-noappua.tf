resource "cloudflare_zone" "noa_pp_ua" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "noa.pp.ua"
}

import {
  to = cloudflare_zone.noa_pp_ua
  id = "927ab1a27118ed30a120752399609a90"
}
