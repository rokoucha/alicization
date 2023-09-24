import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { Construct } from 'constructs'

export type SuperSeisanConfig = Readonly<{
  accountId: string
}>

export class SuperSeisan extends Construct {
  constructor(scope: Construct, id: string, config: SuperSeisanConfig) {
    super(scope, id)

    new PagesProject(this, 'super-seisan', {
      accountId: config.accountId,
      name: 'super-seisan',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build',
        destinationDir: 'dist',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-01-14',
          environmentVariables: {
            NODE_VERSION: '20',
          },
          failOpen: true,
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          prCommentsEnabled: true,
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'all',
          productionBranch: 'master',
          repoName: 'super-seisan',
        },
      },
    })
  }
}
