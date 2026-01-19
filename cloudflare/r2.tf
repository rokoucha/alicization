resource "cloudflare_r2_bucket" "r2_mastodon_8484DC88" {
  account_id = cloudflare_account.account.id
  name       = "mastodon"
}
