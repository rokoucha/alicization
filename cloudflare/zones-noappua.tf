resource "cloudflare_zone" "noa_pp_ua" {
  account = {
    id = cloudflare_account.account.id
  }
  name = "noa.pp.ua"
}
