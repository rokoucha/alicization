resource "cloudflare_zone" "rokoucha_net" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "rokoucha.net"
}

import {
  to = cloudflare_zone.rokoucha_net
  id = "bc6a492f5a6197ebdb5825bb9c3f30f3"
}
