import { Record } from '@cdktf/provider-cloudflare/lib/record'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone'
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

    new Record(this, 'dns-cname-noa.pp.ua', {
      name: 'noa.pp.ua',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-himesaka.noa.pp.ua', {
      name: 'himesaka',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })
  }
}
