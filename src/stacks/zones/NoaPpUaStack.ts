import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider/index.js'
import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { name } from '../../config.js'

export class NoaPpUaStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      hostname: 'app.terraform.io',
      organization: 'rokoucha',
      workspaces: new NamedCloudWorkspace(name),
    })

    const accountId = new TerraformVariable(this, 'CLOUDFLARE_ACCOUNT_ID', {
      description: 'Cloudflare account ID',
      type: 'string',
    })

    const apiToken = new TerraformVariable(this, 'CLOUDFLARE_API_TOKEN', {
      description: 'Cloudflare API token',
      sensitive: true,
      type: 'string',
    })

    new CloudflareProvider(this, 'provider', {
      apiToken: apiToken.value,
    })

    const zone = new Zone(this, 'zone', {
      accountId: accountId.value,
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
