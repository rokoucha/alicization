import { AwsProvider } from '@cdktf/provider-aws/lib/provider/index.js'
import { CloudBackend, NamedCloudWorkspace, TerraformStack } from 'cdktf'
import { Construct } from 'constructs'
import { TFCIAMOidcProvider } from './iam-oidc-provider/index.js'
import { Organizations } from './organizations/index.js'

export class AWSStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      hostname: 'app.terraform.io',
      organization: 'rokoucha',
      workspaces: new NamedCloudWorkspace(id),
    })

    new AwsProvider(this, 'aws', {
      region: 'ap-northeast-1',
    })

    new TFCIAMOidcProvider(this, 'iam-oidc-provider', {
      hostname: 'app.terraform.io',
      organization: 'rokoucha',
      project: 'alicization',
      workspace: 'aws',
    })

    new Organizations(this, 'organizations')
  }
}
