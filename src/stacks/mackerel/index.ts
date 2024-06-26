import { CloudBackend, NamedCloudWorkspace, TerraformStack } from 'cdktf'
import { Construct } from 'constructs'
import { Monitor } from '../../../.gen/providers/mackerel/monitor'
import { MackerelProvider } from '../../../.gen/providers/mackerel/provider'
import { TerraformCloudBackendProps } from '../../config'

export class MackerelStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
    })

    new MackerelProvider(this, 'provider')

    new Monitor(this, 'connectivity', {
      name: 'connectivity',
      connectivity: {},
    }).importFrom('4L9mKtpffPA')
  }
}
