import { R2Bucket } from '@cdktf/provider-cloudflare/lib/r2-bucket'
import { Construct } from 'constructs'

export type R2Config = Readonly<{
  accountId: string
}>

export class R2 extends Construct {
  constructor(scope: Construct, id: string, config: R2Config) {
    super(scope, id)

    new R2Bucket(this, 'mastodon', {
      accountId: config.accountId,
      name: 'mastodon',
    })
  }
}
