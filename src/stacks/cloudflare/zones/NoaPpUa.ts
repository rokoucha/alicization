import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type NoaPpUaConfig = Readonly<{
  accountId: string
}>

export class NoaPpUa extends Construct {
  constructor(scope: Construct, id: string, config: NoaPpUaConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'noa.pp.ua',
    })

    new Record(this, 'cname-noa.pp.ua', {
      name: 'noa.pp.ua',
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })
  }
}
