import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'
import { TFCloudflareStack } from '../../templates/TFCloudflareStack.js'

export class NoaPpUaStack extends TFCloudflareStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: this.accountId.value,
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
