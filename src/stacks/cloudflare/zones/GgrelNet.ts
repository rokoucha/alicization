import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type GgrelNetConfig = Readonly<{
  accountId: string
}>

export class GgrelNet extends Construct {
  constructor(scope: Construct, id: string, config: GgrelNetConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'ggrel.net',
    })
  }
}
