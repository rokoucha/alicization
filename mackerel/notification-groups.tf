resource "mackerel_notification_group" "default" {
  child_channel_ids = [
    "${mackerel_channel.discord.id}"
  ]
  name = "Default"
}
