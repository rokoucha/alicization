import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider/index.js'
import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { TerraformCloudBackendProps } from '../../config.js'
import { Pages } from './pages/index.js'
import { R2 } from './r2/index.js'
import { Workers } from './workers/index.js'
import { Zones } from './zones/index.js'

export class CloudflareStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
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

    new Pages(this, 'pages', {
      accountId: accountId.value,
    })

    new R2(this, 'r2', {
      accountId: accountId.value,
    })

    new Workers(this, 'workers', {
      accountId: accountId.value,
    })

    new Zones(this, 'zones', {
      accountId: accountId.value,
    })
  }
}
