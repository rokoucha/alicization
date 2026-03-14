resource "cloudflare_zone" "ggrel_net" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "ggrel.net"
}
