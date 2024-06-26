import { AwsProvider } from '@cdktf/provider-aws/lib/provider'
import { CloudBackend, NamedCloudWorkspace, TerraformStack } from 'cdktf'
import { Construct } from 'constructs'
import { IAMIdentityCenter } from './iam-identity-center'
import { TFCIAMOidcProvider } from './iam-oidc-provider'
import { Organizations } from './organizations'

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

    const organizations = new Organizations(this, 'organizations')

    new IAMIdentityCenter(this, 'iam-identity-center', {
      accounts: organizations.accounts,
    })
  }
}
