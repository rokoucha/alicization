resource "cloudflare_zone" "sayn_wittgenstein" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "sayn-wittgenste.in"
}

import {
  to = cloudflare_zone.sayn_wittgenstein
  id = "3e6532956ee9bac8397fe88e84bfc793"
}
