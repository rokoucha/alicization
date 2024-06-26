import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { Construct } from 'constructs'

export type GjxConfig = Readonly<{
  accountId: string
}>

export class Gjx extends Construct {
  constructor(scope: Construct, id: string, config: GjxConfig) {
    super(scope, id)

    new PagesProject(this, 'gjx', {
      accountId: config.accountId,
      name: 'gjx',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build',
        destinationDir: 'build',
      },
      deploymentConfigs: {
        production: {
          failOpen: true,
          usageModel: 'standard',
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'none',
          productionBranch: 'master',
          repoName: 'gjx',
        },
      },
    })
  }
}
