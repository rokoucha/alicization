import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project'
import { Construct } from 'constructs'

export type PetaPetaConfig = Readonly<{
  accountId: string
}>

export class PetaPeta extends Construct {
  constructor(scope: Construct, id: string, config: PetaPetaConfig) {
    super(scope, id)

    new PagesProject(this, 'petapeta', {
      accountId: config.accountId,
      name: 'petapeta',
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
          repoName: 'petapeta',
        },
      },
    })
  }
}
