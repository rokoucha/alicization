resource "cloudflare_zone" "sayn_wittgenstein" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "sayn-wittgenste.in"
}
