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
import { Machines } from './services/machines'
import { MateriaCluster } from './services/materia-cluster'

export class MackerelStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    new CloudBackend(this, {
      ...TerraformCloudBackendProps,
      workspaces: new NamedCloudWorkspace(id),
    })

    new MackerelProvider(this, 'provider')

    const discordWebhookUrl = new TerraformVariable(
      this,
      'WATCHDOGS_WEBHOOK_URL',
      {
        description: 'watchdogs webhook url',
        type: 'string',
      },
    )

    const discord = new Channel(this, 'discord', {
      name: 'Discord',
      slack: [
        {
          url: discordWebhookUrl.value,
          enabledGraphImage: true,
          events: ['alert'],
          mentions: {},
        },
      ],
    })

    new NotificationGroup(this, 'default', {
      name: 'Default',
      childChannelIds: [discord.id],
    })

    new Monitor(this, 'connectivity', {
      name: 'connectivity',
      connectivity: {},
    })

    new MateriaCluster(this, 'materia-cluster')
    new GgrelDTV(this, 'ggrel-dtv')
    new Ggrel(this, 'ggrel')
    new Machines(this, 'machines')
  }
}
