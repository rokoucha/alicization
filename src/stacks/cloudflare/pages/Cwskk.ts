import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { Construct } from 'constructs'

export type CwskkConfig = Readonly<{
  accountId: string
}>

export class Cwskk extends Construct {
  constructor(scope: Construct, id: string, config: CwskkConfig) {
    super(scope, id)

    new PagesProject(this, 'cwskk', {
      accountId: config.accountId,
      name: 'cwskk',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'yarn run build',
        destinationDir: 'dist',
      },
      deploymentConfigs: {
        production: {
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
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'all',
          productionBranch: 'master',
          repoName: 'cwskk',
        },
      },
    })
  }
}
