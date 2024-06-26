import {
  CloudBackend,
  NamedCloudWorkspace,
  TerraformStack,
  TerraformVariable,
} from 'cdktf'
import { Construct } from 'constructs'
import { Channel } from '../../../.gen/providers/mackerel/channel'
import { Monitor } from '../../../.gen/providers/mackerel/monitor'
import { NotificationGroup } from '../../../.gen/providers/mackerel/notification-group'
import { MackerelProvider } from '../../../.gen/providers/mackerel/provider'
import { TerraformCloudBackendProps } from '../../config'
import { Ggrel } from './services/ggrel'
import { GgrelDTV } from './services/ggrel-dtv'

export class MackerelStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
    })

    new MackerelProvider(this, 'provider')

    const watchdogsUrl = new TerraformVariable(this, 'WATCHDOGS_WEBHOOK_URL', {
      description: 'watchdogs webhook url',
      type: 'string',
    })

    const watchdogs = new Channel(this, 'watchdogs', {
      name: 'watchdogs',
      slack: [
        {
          url: watchdogsUrl.value,
          enabledGraphImage: true,
          events: ['alert'],
        },
      ],
    })

    new NotificationGroup(this, 'default', {
      name: 'Default',
      childChannelIds: [watchdogs.id],
    })

    new Monitor(this, 'connectivity', {
      name: 'connectivity',
      connectivity: {},
    })

    new GgrelDTV(this, 'ggrel-dtv')
    new Ggrel(this, 'ggrel')
  }
}
