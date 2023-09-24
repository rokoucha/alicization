import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type RokouchaNetConfig = Readonly<{
  accountId: string
}>

export class RokouchaNet extends Construct {
  constructor(scope: Construct, id: string, config: RokouchaNetConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'rokoucha.net',
    })
  }
}
