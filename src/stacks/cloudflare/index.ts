import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider/index.js'
import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { name } from '../../config.js'
import { NoaPpUa } from './zones/NoaPpUa.js'
import { _8c7042 } from './zones/_8c7042.js'

export class CloudflareStack extends TerraformStack {
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

    new _8c7042(this, '_8c7042.org', {
      accountId: accountId.value,
    })

    new NoaPpUa(this, 'noa.pp.ua', {
      accountId: accountId.value,
    })
  }
}
