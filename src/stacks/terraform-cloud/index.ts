import { NotificationConfiguration } from '@cdktf/provider-tfe/lib/notification-configuration'
import { Organization } from '@cdktf/provider-tfe/lib/organization'
import { Project } from '@cdktf/provider-tfe/lib/project'
import { TfeProvider } from '@cdktf/provider-tfe/lib/provider'
import { Variable } from '@cdktf/provider-tfe/lib/variable'
import { Workspace } from '@cdktf/provider-tfe/lib/workspace'
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

    const email = new TerraformVariable(this, 'TFC_ORGANIZATION_EMAIL', {
      description: 'Terraform Cloud organization email',
      type: 'string',
    })

    const discordNotificationWebhookUrl = new TerraformVariable(
      this,
      'DISCORD_NOTIFICATION_WEBHOOK_URL',
      {
        description: 'Discord notification webhook URL for Terraform Cloud',
        type: 'string',
      },
    )

    const organization = new Organization(this, 'organization', {
      name: 'rokoucha',
      email: email.value,
    })

    const project = new Project(this, 'alicization', {
      name: 'alicization',
      organization: organization.name,
    })
    project.importFrom('prj-488VXbvWS4Qms8Fp')

    const aws = new Workspace(this, 'aws', {
      name: 'aws',
      organization: organization.name,
      projectId: project.id,
      queueAllRuns: false,
      terraformVersion: '~> 1.9.0',
    })

    new NotificationConfiguration(this, 'aws-notification-discord', {
      name: 'Discord',
      destinationType: 'slack',
      enabled: true,
      triggers: [
        'run:applying',
        'run:completed',
        'run:created',
        'run:errored',
        'run:needs_attention',
        'run:planning',
      ],
      url: discordNotificationWebhookUrl.value,
      workspaceId: aws.id,
    })

    new Variable(this, 'aws-TFC_AWS_PROVIDER_AUTH', {
      key: 'TFC_AWS_PROVIDER_AUTH',
      value: 'true',
      category: 'env',
      workspaceId: aws.id,
    })

    new Variable(this, 'aws-TFC_AWS_RUN_ROLE_ARN', {
      key: 'TFC_AWS_RUN_ROLE_ARN',
      category: 'env',
      workspaceId: aws.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    const cloudflare = new Workspace(this, 'cloudflare', {
      name: 'cloudflare',
      organization: organization.name,
      projectId: project.id,
      queueAllRuns: false,
      terraformVersion: '~> 1.9.0',
    })

    new NotificationConfiguration(this, 'cloudflare-notification-discord', {
      name: 'Discord',
      destinationType: 'slack',
      enabled: true,
      triggers: [
        'run:applying',
        'run:completed',
        'run:created',
        'run:errored',
        'run:needs_attention',
        'run:planning',
      ],
      url: discordNotificationWebhookUrl.value,
      workspaceId: cloudflare.id,
    })

    new Variable(this, 'cloudflare-CLOUDFLARE_API_TOKEN', {
      key: 'CLOUDFLARE_API_TOKEN',
      category: 'env',
      sensitive: true,
      workspaceId: cloudflare.id,
    })

    const mackerel = new Workspace(this, 'mackerel', {
      name: 'mackerel',
      organization: organization.name,
      projectId: project.id,
      queueAllRuns: false,
      terraformVersion: '~> 1.9.0',
    })

    new NotificationConfiguration(this, 'mackerel-notification-discord', {
      name: 'Discord',
      destinationType: 'slack',
      enabled: true,
      triggers: [
        'run:applying',
        'run:completed',
        'run:created',
        'run:errored',
        'run:needs_attention',
        'run:planning',
      ],
      url: discordNotificationWebhookUrl.value,
      workspaceId: mackerel.id,
    })

    new Variable(this, 'mackerel-WATCHDOGS_WEBHOOK_URL', {
      key: 'WATCHDOGS_WEBHOOK_URL',
      category: 'terraform',
      workspaceId: mackerel.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Variable(this, 'mackerel-MACKEREL_API_KEY', {
      key: 'MACKEREL_API_KEY',
      category: 'env',
      sensitive: true,
      workspaceId: mackerel.id,
    })

    const terraformCloud = new Workspace(this, 'terraform-cloud', {
      name: 'terraform-cloud',
      organization: organization.name,
      projectId: project.id,
      queueAllRuns: false,
      terraformVersion: '~> 1.9.0',
    })

    new NotificationConfiguration(
      this,
      'terraform-cloud-notification-discord',
      {
        name: 'Discord',
        destinationType: 'slack',
        enabled: true,
        triggers: [
          'run:applying',
          'run:completed',
          'run:created',
          'run:errored',
          'run:needs_attention',
          'run:planning',
        ],
        url: discordNotificationWebhookUrl.value,
        workspaceId: terraformCloud.id,
      },
    )

    new Variable(this, 'terraform-cloud-TFC_ORGANIZATION_EMAIL', {
      key: 'TFC_ORGANIZATION_EMAIL',
      category: 'terraform',
      workspaceId: terraformCloud.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Variable(this, 'terraform-cloud-TFE_TOKEN', {
      key: 'TFE_TOKEN',
      category: 'env',
      sensitive: true,
      workspaceId: terraformCloud.id,
    })

    new Variable(this, 'terraform-cloud-DISCORD_NOTIFICATION_WEBHOOK_URL', {
      key: 'DISCORD_NOTIFICATION_WEBHOOK_URL',
      category: 'terraform',
      sensitive: true,
      workspaceId: terraformCloud.id,
    })
  }
}
