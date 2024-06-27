import { Organization } from '@cdktf/provider-tfe/lib/organization'
import { TfeProvider } from '@cdktf/provider-tfe/lib/provider'
import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { TerraformCloudBackendProps } from '../../config'

export class TerraformCloudStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
    })

    new TfeProvider(this, 'tfe')

    const name = new TerraformVariable(this, 'TFC_ORGANIZATION_NAME', {
      description: 'Terraform Cloud organization name',
      type: 'string',
    })

    const email = new TerraformVariable(this, 'TFC_ORGANIZATION_EMAIL', {
      description: 'Terraform Cloud organization email',
      type: 'string',
    })

    new Organization(this, 'organization', {
      name: name.value,
      email: email.value,
    })
  }
}
