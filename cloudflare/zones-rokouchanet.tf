resource "cloudflare_zone" "rokoucha_net" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "rokoucha.net"
}
