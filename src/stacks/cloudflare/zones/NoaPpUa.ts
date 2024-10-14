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
    zone.importFrom('927ab1a27118ed30a120752399609a90')

    new Record(this, 'dns-cname-noa.pp.ua', {
      name: 'noa.pp.ua',
      proxied: false,
      type: 'CNAME',
      value: 'materia.ggrel.net',
      zoneId: zone.id,
    })
  }
}
