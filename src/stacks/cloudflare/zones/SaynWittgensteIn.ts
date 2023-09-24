import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type SaynWittgensteInConfig = Readonly<{
  accountId: string
}>

export class SaynWittgensteIn extends Construct {
  constructor(scope: Construct, id: string, config: SaynWittgensteInConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'sayn-wittgenste.in',
    })
  }
}
