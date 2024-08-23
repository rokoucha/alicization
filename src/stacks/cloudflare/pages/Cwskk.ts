import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project'
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
        buildCaching: true,
        buildCommand: 'pnpm run build:preview',
        destinationDir: 'dist/preview',
      },
      deploymentConfigs: {
        production: {
          environmentVariables: {
            NODE_VERSION: '22',
          },
          failOpen: true,
          usageModel: 'standard',
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
