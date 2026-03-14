resource "cloudflare_account" "account" {
  name = "rokoucha"
}

import {
  to = cloudflare_account.account
  id = "9c06fda7643a430591cf56d434d1837f"
}
