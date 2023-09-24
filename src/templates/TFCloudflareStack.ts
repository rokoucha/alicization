import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider/index.js'
import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { name } from '../config.js'

export abstract class TFCloudflareStack extends TerraformStack {
  protected readonly accountId: TerraformVariable

  constructor(scope: Construct, id: string) {
    super(scope, id)

    // 状態を Terraform Cloud に保存する
    new CloudBackend(this, {
      hostname: 'app.terraform.io',
      organization: 'rokoucha',
      workspaces: new NamedCloudWorkspace(name),
    })

    // Cloudflare の Provider を用意
    const apiToken = new TerraformVariable(this, 'CLOUDFLARE_API_TOKEN', {
      description: 'Cloudflare API token',
      sensitive: true,
      type: 'string',
    })

    new CloudflareProvider(this, 'provider', {
      apiToken: apiToken.value,
    })

    // 提供する変数
    this.accountId = new TerraformVariable(this, 'CLOUDFLARE_ACCOUNT_ID', {
      description: 'Cloudflare account ID',
      type: 'string',
    })
  }
}
