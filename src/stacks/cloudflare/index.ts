import { Account } from '@cdktf/provider-cloudflare/lib/account'
import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider'
import { CloudBackend, NamedCloudWorkspace, TerraformStack } from 'cdktf'
import { Construct } from 'constructs'
import { TerraformCloudBackendProps } from '../../config'
import { Pages } from './pages'
import { R2 } from './r2'
import { Workers } from './workers'
import { Zones } from './zones'

export class CloudflareStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
    })

    new CloudflareProvider(this, 'provider')

    const account = new Account(this, 'account', {
      name: 'rokoucha',
    })

    new Pages(this, 'pages', {
      accountId: account.id,
    })

    new R2(this, 'r2', {
      accountId: account.id,
    })

    new Workers(this, 'workers', {
      accountId: account.id,
    })

    new Zones(this, 'zones', {
      accountId: account.id,
    })
  }
}
